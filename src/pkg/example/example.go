package example

type Example struct {
    Name  string
    Value int
}

func (e *Example) GetName() string {
    return e.Name
}

func (e *Example) GetValue() int {
    return e.Value
}

func NewExample(name string, value int) *Example {
    return &Example{Name: name, Value: value}
}