- What is the use of the primary key in the Database?
In the relational model of databases, a primary key is a specific choice of a minimal set of attributes that uniquely specify a tuple in a relation. Informally, a primary key is "which attributes identify a record," and in simple cases constitute a single attribute: a unique ID.
You can use key values ??to refer to entire records, since each record has a different key value.

- Why use ID as an auto-increment?
To have an auto-increment PK makes it easy to create a key that never needs to change, which in turn makes it easy to reference in other tables.
Speed up insert, search records, sort data

- Why does a table have the same primary key on multiple columns?
When the table is not an object but a combination of many many relationship other tables.