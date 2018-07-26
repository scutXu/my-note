//store发生改变时会被调用，返回的对象会和Component的props进行Object.assign操作
//访问this.props.count时相当于访问state.count
const mapStateToProps = state => {
    return ({
        count: state.count
    })
}


function genIncreaseAction(value) {
	return ({
		type: 'INCREASE',
		value //属性初始值简写
	})
}


//mapDispatchToProps是个函数时
//函数返回的对象会和Component的props进行Object.assign操作
//调用this.props.increase(5)相当于调用dispatch(genIncreaseAction(5))
const mapDispatchToProps = dispatch => {
	return ({
		increase: (value) => {
			dispatch(genIncreaseAction(value))
		}
	})
}


//mapDispatchToProps是个对象时
//不在increase函数中调用dispatch，而是redux负责将increase返回的对象作为参数去调用dispatch
const mapDispatchToProps = {
	increase: (value) => {
		return genIncreaseAction(value)
	}

	//其实可以直接简写成
	//increase: genIncreaseAction
}

class Counter extends Component {

}
export default connect(mapStateToProps, mapDispatchToProps)(Counter);





