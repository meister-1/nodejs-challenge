import express from "express"
import fetchData from "./data"
import permutations from "./permutations"

const app = express()

const port = 9005 


app.get("/*", (_req, res) => {

  const products = fetchData("sql here")

  const result = permutations(products)

  res.status(200).send(result)

})

const server = app.listen(port)

console.info(`listening ${port}`)

process.on("SIGINT", () => {
  server.close(() => process.exit(0))
})