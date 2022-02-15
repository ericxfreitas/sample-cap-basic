
const { Order_Header } = cds.entities('test1_eric')

module.exports = srv => {
    srv.after('READ', 'Order_Header', items => {
        return items.map(item => {
            if (item.C_TOTAL > 200) {
                item.C_NAME += ' VERY HIGH VALUE!'
            }
            return item
        })
    })

    srv.on('getTotalOrderPrice', async (req) => {
        const items = await cds.tx(req).run(SELECT.from(Order_Header))
        return items.reduce((a, item) => a + item.C_TOTAL, 0)
    })
}