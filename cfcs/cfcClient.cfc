component displayName="cfcClient" {    

  public any function init() 
    description="initialize the component"{

    return this;
  
  }
  
  public query function getClient(required string id) 
    description="query database for client" {

    objClient = new Query(datasource=request.dsn)
      .setSQL("
        SELECT c.id, c.name, c.contact, c.email, c.phone
        FROM inv_clients c
        WHERE c.id = :id
      ");
    
    objClient.addParam(name="id",value=trim(arguments.id),CFSQLTYPE="CF_SQL_STRING");

    return objClient.execute().getResult(); 

  }

  public query function getClients() 
    description="query database for all clients" {

    return new Query(datasource=request.dsn)
      .setSQL("
        SELECT c.id, c.name, c.contact, c.email, c.phone
        FROM inv_clients c
        ORDER BY c.name
      ")
      .execute()
      .getResult();

    //return objClients;  
    
  }

  public string function validateClient(required struct client) 
    description="validate client values" {
      
    if (
      !len(trim(client.name)) or
      !len(trim(client.contact)) or
      !len(trim(client.email)) or
      !len(trim(client.phone))
    ) {
      return "Please fill in all required fields";
    }

    return "true";
  }

  public string function upsertClient(required struct client) 
    description="validate client values" {

    validateSuccess = validateClient(form);

    if (validateSuccess eq "true") {
      if (arguments.client.id neq "NEW") {
        objClient = new Query(datasource=request.dsn)
          .setSQL("
            UPDATE inv_clients
            SET name = :name, contact = :contact, email = :email, phone = :phone
            WHERE id = :id
          ");

        objClient.addParam(name="id",value=trim(arguments.client.id),CFSQLTYPE="CF_SQL_STRING");  
      
      } else {
      
        objClient = new Query(datasource=request.dsn)
          .setSQL("
            INSERT INTO inv_clients (
              id, name, contact, email, phone
            )
            VALUES (
              :id, :name, :contact, :email, :phone
            )
          ");

        objClient.addParam(name="id",value=CreateUUID(),CFSQLTYPE="CF_SQL_STRING");  
      }
      
      objClient.addParam(name="name",value=trim(arguments.client.name),CFSQLTYPE="CF_SQL_STRING");
      objClient.addParam(name="contact",value=trim(arguments.client.contact),CFSQLTYPE="CF_SQL_STRING");
      objClient.addParam(name="email",value=trim(arguments.client.email),CFSQLTYPE="CF_SQL_STRING");
      objClient.addParam(name="phone",value=trim(arguments.client.phone),CFSQLTYPE="CF_SQL_STRING");
    
      objClient.execute();

      return true;
    }

    return validateSuccess;
  }
}