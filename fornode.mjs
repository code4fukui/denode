import { exec } from "child_process";

console.log("hello node!");

const cmd = "~/.deno/bin/deno run -A fordeno.js";
exec(cmd, (err, stdout, stderr) => {
    if (err) {
      console.log(`stderr: ${stderr}`)
      return
    }
    console.log(`stdout: ${stdout}`)
  }
);
