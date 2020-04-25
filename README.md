# aprs_parse

**Parse raw APRS packets into meaningful data**

Turn this:
```
SNOPAS>APN391,qAR,VCAPK:!4725.13NS12124.48W#PHG4540W2,WAn-n,Snoqualmie Pass
```
into this:
```elixir
%{
  base_callsign: "SNOPAS",
  data_extended: %{
    aprs_messaging?: false,
    comment: "PHG4540W2,WAn-n,Snoqualmie Pass",
    data_type: :position,
    position: 47°25'7.8"N 121°24'28.8"W,
    symbol_code: "#",
    symbol_table_id: "S"
  },
  data_type: :position,
  destination: "APN391",
  information_field: "!4725.13NS12124.48W#PHG4540W2,WAn-n,Snoqualmie Pass",
  path: "qAR,VCAPK",
  sender: "SNOPAS",
  ssid: nil
}
```

## Installation
aprs_parse can be installed
by adding `aprs_parse` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:aprs_parse, "~> 0.1.0"}
  ]
end
```

## Usage
```elixir
iex(1)> raw_message = "SNOPAS>APN391,qAR,VCAPK:!4725.13NS12124.48W#PHG4540W2,WAn-n,Snoqualmie Pass"

iex(2)> parsed_message = Aprs.Parser.parse(raw_message)
```

## Notes
Currently, aprs_parse supports almost all of the many APRS message types. There are a couple of areas marked by TODO in the source code that I haven't fleshed out yet. One of these is for compressed lat/lon coordinates, and the other is for ULTIMETER weather stations. I don't see these very often in practice, but they do come through occasionally. 

This library was originally built to parse data coming from APRS-IS, but was split out to be a standalone parser after I got some requests from the ham radio community. If you are interested in tapping into APRS-IS servers to send/receive/process messages, check out the original project: https://github.com/Matt-Hornsby/aprsEx
