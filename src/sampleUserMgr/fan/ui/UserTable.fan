using dom
using domkit

// @Js class UserTableModel : TableModel {
//   override Int numCols(){}
// }

class UserTable {
  new make(Int cols, Int rows, Str[][] data){
    Int nCols := cols
    Int nRows := rows
    Str[][] nData := data
  }

  // creating header
  private Void buildHeader(Str[] data){
    for(i:=0;i<data.size;i++){
      echo(data[i])
    }
  }

  // populating table with data
  private Void populateTable(Str[][] data) {
    for(i:=1; i<data[i].size;i++){
      for(j:=1; i<data[j].size;j++){
        // data goes in the table
      }
    }
  }

  public Void buildTable(){

  }

}


