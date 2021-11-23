console.log("hello deno!");

const p = Deno.run({ cmd: ["node", "hello.mjs"] });
await p.status();
