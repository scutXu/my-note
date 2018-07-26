import thunk from 'redux-thunk'

const store = createStore(
  reducer,
  applyMiddleware(thunk)
)

setTimeout(() => {
  store.dispatch(action)
}, 5000)


//
store.dispatch(dispatch => {
	setTimeout(() => {
		dispatch(action)
	}, 5000)
})