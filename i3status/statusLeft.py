#!/bin/python3
import alsaaudio
from i3pystatus import Status
from i3pystatus.weather import weathercom

status = Status(standalone=True)

status.register("clock", format="%a %-d %b %X WW%V",)

status.register("weather",
        format="Gdynia: {current_temp}{temp_unit}, {wind_direction}-{wind_speed}{wind_unit} H:{humidity}%",
        colorize=True,
        backend=weathercom.Weathercom(
            location_code="PLXX0006",
            units='metric',
            ),

        )

status.register("alsa",
        format="♪:{volume}",
        format_muted="♪:muted"
        ,)
# Shows mpd status
# Format:
# Cloud connected▶Reroute to Remain
status.register("mpd",
        format="({status}){artist} - {title}",
        status={
            "pause": "▷",
            "play": "▶",
            "stop": "◾",
            },
        max_len=100,
        )

status.run()
