
## Tasks api
#Authentication
Tasks api is protected using Api Keys. Each registered user (Admin or User) have unique api keys, which is auto generated from system on time of creation. Assigned Api Keys needs to be sent in HTTP authorization header for authentication.

## Features
#Admin
 * can add new task lists and task
 * can manage new users

#User
 * can view task lists and task
 * can view other users details, expect(key)
 * can create multiple task lists and task

#Guest User
 * can view task lists and task details
 * can view other users, expect(key)
