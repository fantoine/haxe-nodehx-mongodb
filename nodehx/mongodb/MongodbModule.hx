package nodehx.mongodb;

// Need : Server, ReplSet, Mongos ??
extern class MongodbModule implements nodehx.Node.NodeModule<"mongodb", "events", "Admin,Binary,BSON,Code,Collection,Cursor,CursorStream,Db,DBRef,Double,Grid,GridStore,Long,MaxKey,MongoClient,Mongos,ObjectID,ReadStream,Server,Symbol,Timestamp"> {}