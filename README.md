# [crates.io](https://crates.io) HTTP API Reference


## Reference

**Note**: All paths presented here are relative to https://crates.io/api/v1!

- `/crates` [`GET`](#user-content-get-crates)
  - `/new` [`PUT`](#user-content-put-cratesnew)
  - `/{crate_id}` [`GET`](#user-content-get-cratescrate_id)
    - `/{version}` [`GET`](#user-content-get-cratescrate_idversion)
      - `/download` [`GET`](#user-content-get-cratescrate_idversiondownload)
      - `/dependencies` [`GET`](#user-content-get-cratescrate_idversiondependencies)
      - `/downloads` [`GET`](#user-content-get-cratescrate_idversiondownloads)
      - `/authors` [`GET`](#user-content-get-cratescrate_idversionauthors)
      - `/yank` [`DELETE`](#user-content-delete-cratescrate_idversionyank)
      - `/unyank` [`PUT`](#user-content-put-cratescrate_idversionunyank)
    - `/downloads` [`GET`](#user-content-get-cratescrate_iddownloads)
    - `/versions` [`GET`](#user-content-get-cratescrate_idversions)
    - `/follow` [`PUT`](#user-content-put-cratescrate_idfollow)/[`DELETE`](#user-content-delete-cratescrate_idfollow)
    - `/following` [`GET`](#user-content-get-cratescrate_idfollowing)
    - `/owners` [`GET`](#user-content-get-cratescrate_idowners)/[`PUT`](#user-content-put-cratescrate_idowners)/[`DELETE`](#user-content-delete-cratescrate_idowners)
    - `/reverse_dependencies` [`GET`](#user-content-get-cratescrate_idreverse_dependencies)
- `/versions` [`GET`](#user-content-get-versions)
  - `/{version_id}` [`GET`](#user-content-get-versionsversion_id)
- `/keywords` [`GET`](#user-content-get-keywords)
  - `/{keyword_id}` [`GET`](#user-content-get-keywordskeyword_id)
- `/categories` [`GET`](#user-content-get-categories)
  - `/{category_id}` [`GET`](#user-content-get-categoriescategory_id)
- `/category_slugs` [`GET`](#user-content-get-category_slugs)
- `/users` (no access)
  - `/{user_id}` [`GET`](#user-content-get-usersuser_id)


## Description

#### `GET /crates`

Get general info about crates.

##### Parameters

- `category` Limit results to crates in this category
  - valid values: any
  - no fall back
- `following` Limit results to crates the requesting user is following
  - valid values: any
  - no fall back
- `keywords` Limit results to crates with this keyword
  - valid values: any
  - no fall back
- `letter` Pattern-based search (in particular, SQL LIKE-based)
  - valid values: any
  - no fall back
- `q` ?
  - valid values: ?
  - no fall back
- `sort` Results sorting method
  - valid values: `alpha`, `downloads`
  - falls back to `alpha`
- `user_id` Limit results to crates of this user
  - valid values: any
  - no fall back

#### `PUT /crates/new`

Create a new crate.

#### `GET /crates/{crate_id}`

Get general info about `:crate_id` crate.

#### `GET /crates/{crate_id}/{version}`

Get info about `:crate_id` crate of version `:version`.

#### `GET /crates/{crate_id}/{version}/download`

Download tar-gzipped source code of `:crate_id` crate of version `:version`.

#### `GET /crates/{crate_id}/{version}/dependencies`

List dependencies of `:crate_id` crate of version `:version`.

#### `GET /crates/{crate_id}/{version}/downloads`

Get number of downloads by date of `:crate_id` crate of version `:version`.

##### Parameters

- `before_date` Limit results to downloads before the specified date
  - valid values: date in format `%Y-%m-%d`, where `%Y` — 4 digits of year, `%m` — month from 1 to 12, `%d` — day of month from 1 to 31
  - no fall back

#### `GET /crates/{crate_id}/{version}/authors`

List authors of `:crate_id` crate of version `:version`.

#### `DELETE /crates/{crate_id}/{version}/yank`

Yank `:crate_id` crate of version `:version`.

#### `PUT /crates/{crate_id}/{version}/unyank`

Unyank `:crate_id` crate of version `:version`.

#### `GET /crates/{crate_id}/downloads`

Get number of total downloads of `:crate_id` crate.

#### `GET /crates/{crate_id}/versions`

List versions of `:crate_id` crate.

#### `PUT /crates/{crate_id}/follow`

?

#### `DELETE /crates/{crate_id}/follow`

?

#### `GET /crates/{crate_id}/following`

?

#### `GET /crates/{crate_id}/owners`

List owners of `:crate_id` crate.

#### `PUT /crates/{crate_id}/owners`

Add an owner to `:crate_id` crate.

#### `DELETE /crates/{crate_id}/owners`

Delete an owner from `:crate_id` crate.

#### `GET /crates/{crate_id}/reverse_dependencies`

List reverse dependencies of `:crate_id` crate.

#### `GET /versions`

?

##### Parameters

- `ids[]` ?
  - valid values: ?
  - no fall back

#### `GET /versions/{version_id}`

?

#### `GET /keywords`

List keywords of crates uploaded to [crates.io](https://crates.io).

##### Parameters

- `sort` Results sorting method
  - valid values: `alpha`, `crates`
  - falls back to `alpha`

#### `GET /keywords/{keyword_id}`

Get info about the `:keyword_id` keyword.

#### `GET /categories`

List categories of crates uploaded to [crates.io](https://crates.io).

##### Parameters

- `sort` Results sorting method
  - valid values: `alpha`, `crates`
  - falls back to `alpha`

#### `GET /categories/{category_id}`

Get info about the `:category_id` category.

#### `GET /category_slugs`

?

#### `GET /users/{user_id}`

Get info about the `:user_id` user.
