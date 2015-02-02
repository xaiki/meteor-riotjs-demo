
<todo>

  <h3>{ opts.title }</h3>

  <ul>
    <li each={ cursor.filter(filter) }>
      <label class={ completed: done }>
          <input type="checkbox" checked={ done } onclick={ parent.toggle }> { title }
          <input type="button" class="delete"     onClick={ parent.delete }>
      </label>

    </li>
  </ul>

  <form onsubmit={ add }>
    <input name="input" onkeyup={ edit }>
    <button disabled={ !text }>Add #{ cursor.length + 1 }</button>
  </form>

  this.items = opts.items

  observe = RiotMeteor.Observe.bind(this);
  observe (this.items.find({}), 'cursor');

  edit(e) {
    this.text = e.target.value
  }

  add(e) {
  if (this.text) {
      this.items.insert({ title: this.text })
      this.text = this.input.value = ''
    }
  }

  // an example how to filter items on the list
  filter(item) {
    return !item.hidden
  }

  toggle(e) {
    var item = e.item
    item.done = !item.done
    return true
  }

  delete(e) {
  var item = e.item
  this.items.remove(item._id);
  }

</todo>
