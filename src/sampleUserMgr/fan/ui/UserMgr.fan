//
// Copyright (c) 2019, SkyFoundry LLC
// Licensed under the MIT License
//
// History:
//   23 Dec 2019  Andy Frank  Creation
//

using dom
using domkit
using web
using util

@Js class UserMgr : Box
{
  ** Client-side entry point.
  static Void main()
  {
    mgr := UserMgr {}
    Win.cur.doc.body.add(mgr)
    mgr.onInit
  }

  ** Constructor.
  new make()
  {
    toolbar := FlowBox {
      it.gaps = ["4px"]
      Button { it.text="New";    it.onAction { onNew  } },
      Button { it.text="Edit";   it.onAction { onEdit }; it.enabled=false   },
      Button { it.text="Delete"; it.onAction { onDel  }; it.enabled=false },
    }

    // TODO: replace me with domkit::Table which is empty
    // to start. See onInit to load model data.
    table := Table {
      it.style.addClass("domkit-border")
      it.style.addClass("domkit-Table-header")
      it.style->padding = "50px"
      it.style->background = "#dd00ee"
      it.text = "TODO: user table here"
    }

    this.style->padding = "10px"
    this.add(SashBox {
      it.dir = Dir.down
      it.sizes = ["24px","10px","100%"]
      toolbar,
      Box {},  // spacer
      table,
    })
  }


  ** Init callback to load data
  private Void onInit()
  {
    HttpReq { uri = `data/users.csv` }.get |res| {
         inStrm := CsvInStream(res.content.in)
         Str[][] readRows := inStrm.readAllRows()
        this.initTable(readRows)
    }  
  }

  private Void initTable(Str[][] data){
    echo(data.size)
    model := UserTable(data.size) {}
    for(i:=0; i<data.size; i++){
      for(j:=0;j<data[i].size; j++){
        echo(data[i][j])
      }
    }
  }

  ** Callback to create a new record.
  private Void onNew()
  {
    // TODO:
    //  - present form to update user data
    //  - req to server to update rec in "database"
    //  - reload table data

    NewUser.open |form|
    {
      // TODO
      Win.cur.alert(form)
    }
  }

  ** Callback to edit an existing record.
  private Void onEdit()
  {
    // TODO:
    //  - present form to update user data
    //  - req to server to update rec in "database"
    //  - reload table data
  }

  ** Callback to delete an existing record.
  private Void onDel()
  {
    // TODO:
    //  - challengr user to confirm action
    //  - req to server to remove content
    //  - reload table data
  }
}