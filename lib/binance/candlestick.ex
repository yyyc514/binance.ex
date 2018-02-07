defmodule Binance.Candlestick do
  @moduledoc """
  Struct for representing Candlestick results as returned by /api/v1/klines
  """

  defstruct [
    :open_time,
    :open,
    :high,
    :low,
    :close,
    :volume,
    :close_time,
    :quote_asset_volume,
    :trades,
    :taker_buy_base_asset_volume,
    :taker_buy_quote_asset_volume,
    :reserved1
  ]

  def new(candles=[hd|_tail]) when is_list(candles) and is_list(hd) do
    candles
    |> Enum.map(fn(candle) ->
      new(candle)
    end)
  end

  def new(candle=[hd|_tail]) when is_integer(hd) do
    %Binance.Candlestick{
      open_time: Enum.at(candle,0),
      open: Enum.at(candle,1) |> String.to_float,
      high: Enum.at(candle,2) |> String.to_float,
      low: Enum.at(candle,3) |> String.to_float,
      close: Enum.at(candle,4) |> String.to_float,
      volume: Enum.at(candle,5) |> String.to_float,
      close_time: Enum.at(candle,6),
      quote_asset_volume: Enum.at(candle,7) |> String.to_float,
      trades: Enum.at(candle,8),
      taker_buy_base_asset_volume: Enum.at(candle,9) |> String.to_float,
      taker_buy_quote_asset_volume: Enum.at(candle,10) |> String.to_float,
      # leave it as a string since we can't be sure what it is
      reserved1: Enum.at(candle,11)
    }
  end

end
