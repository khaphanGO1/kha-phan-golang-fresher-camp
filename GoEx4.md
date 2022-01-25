Why should not use foreign keys, weaknesses of foreign keys:
- Reduce the speed of data add, edit, delete operations
- Difficult to operate on large systems
- When a data is wrong, the error can be ignored and corrected later
- Sometimes you know beforehand your data is going to be dirty, you accept that, and you want the DB to accept it
- Not necessary when the data system does not require consistency
- Difficult to be flexible when constrained to other tables