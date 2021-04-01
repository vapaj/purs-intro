const demoPerson = { name: "demo" }
demoPerson = "whatever"
function getName(person) {
  person.name = "YOLO";
  return person.name;
}

console.log("name: ", getName(demoPerson));
console.log("person: ", demoPerson);



function a() {
  return undefined;
}

const b = a() + 4;
