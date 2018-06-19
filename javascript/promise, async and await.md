```
let promise = new Promise(resolve => {
	setTimeout(() => {
		resolve("hello");
	}, 2000);
});

//then写法
promise.then(result => {
	console.log(result);  //"hello"
});

//async/await写法
async function asyncCall() {
	let result = await promise;
	console.log(result); // "hello"
}
```

