#!/bin/python3
import alsaaudio
from i3pystatus import Status

status = Status(standalone=True)

status.register("clock", format="%a %-d %b %X WW%V",)

status.register("weather",
        location_code="PLXX0006",
        format="Gdynia: {current_temp}, {current_wind}, H:{humidity}%"
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
