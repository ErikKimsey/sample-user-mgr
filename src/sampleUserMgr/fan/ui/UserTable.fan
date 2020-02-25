using dom
using domkit

// @Js class UserTableModel : TableModel {
//   override Int numCols(){}
// }

@Js class UserTable {
  new make(Int cols, Int rows, Str[][] data){
    Int nCols := cols
    Int nRows := rows
    Str[][] nData := data
  }

  // creating header
  private Void buildHeader(){
    for(i:=0;i<this.nData[0].size;i++){
      echo(this.nData[0][i])
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


