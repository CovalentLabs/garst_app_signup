defmodule GarstApp.URLDirectionTest do
  use GarstApp.ModelCase

  alias GarstApp.URLDirection

  @valid_attrs %{active: true, path: "some content", token: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = URLDirection.changeset(%URLDirection{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = URLDirection.changeset(%URLDirection{}, @invalid_attrs)
    refute changeset.valid?
  end
end
