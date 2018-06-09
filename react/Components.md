###Functional Component

```
const Welcome = ({ props }) => (<h1>Hello, {props.name}!</h1>);

function Welcome(props) {
  return <h1>Hello, {props.name}</h1>;
}
```

###Class Component

```
class Welcome extends React.Component {
  render() {
    return <h1>Hello, {this.props.name}</h1>;
  }
}
```

###Rendering a Component

```
const element = <Welcome name="Sara" />;
ReactDOM.render(
  element,
  document.getElementById('root')
);
```

###Composing Components
```
function App() {
  return (
    <div>
      <Welcome name="Sara" />
      <Welcome name="Cahal" />
      <Welcome name="Edite" />
    </div>
  );
}
```
