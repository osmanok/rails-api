# Rails API with Authentication

## Installation

```
$ bundle install
```

```
$ yarn install 
```

```
$ rails db:migrate 
```

```
$ rails s 
```

# Posts

| Route | HTTP Verb	 | POST body	 | Description	 |
| --- | --- | --- | --- |
| /api/v1/posts | `GET` | Empty | List all posts. |
| /api/v1/posts | `POST` | {'title':'foo', 'body':'bar', 'visible':true } | Create a new post. |
| /api/v1/posts/:post_id | `GET` | Empty | Get a posts. |
| /api/v1/posts/:post_id | `PUT` | {'title':'foo', 'body':'bar'} | Update a post with new info. |
| /api/v1/posts/:post_id | `DELETE` | Empty | Delete a post. |

# Comments

| Route | HTTP Verb	 | POST body	 | Description	 |
| --- | --- | --- | --- |
| /api/v1/posts/:post_id/comments | `GET` | Empty | List all comments in :post_id post. |
| /api/v1/posts/:post_id/comments | `POST` | { title: 'foo', content:'bar' } | Create a new comments. |
| /api/v1/posts/:post_id/comments/:comment_id | `GET` | Empty | Get a comment. |


# Feed and Dashboard

| Route | HTTP Verb	 | POST body	 | Description	 |
| --- | --- | --- | --- |
| /api/v1/feed | `GET` | empty | Shows followed user and current user posts. |
| /api/v1/dashborad | `GET` | empty | Shows current user posts and comments. |


# Authentication

localhost:3000 is the default port for rails server.

Sign up and get bearer token

## Example Request

![example request](https://i.ibb.co/kBh8D9x/Screenshot-at-Nov-03-17-37-06.png)

