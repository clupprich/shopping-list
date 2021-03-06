defmodule ShoppingListWeb.Router do
  use ShoppingListWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ShoppingListWeb do
    pipe_through :browser

    get "/", PageController, :index

    resources "/lists", ListController, except: [:index] do
      resources "/items", ItemController, only: [:create, :update, :delete]
    end
  end

  # Other scopes may use custom stacks.
  # scope "/api", ShoppingListWeb do
  #   pipe_through :api
  # end
end
