const express = require("express");
const app = express();

app.use(express.json());

app.get("/api", (req, res) => {
  res.send("/ endpoint - accessed at URL/api");
});

app.get("/api/single", (req, res) => {
  res.send("/single endpoint - accessed at URL/api/single");
});

app.get("/api/double/two", (req, res) => {
  res.send("/double/two endpoint - accessed at URL/api/double/two");
});

const PORT = 5000;
app.listen(PORT, () => {
  console.log(`APP started on ${PORT}`);
});
