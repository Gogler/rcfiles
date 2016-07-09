#!/bin/python3
import i3pystatus
#from i3pystatus import Status

status = i3pystatus.Status(standalone=True)

status.register("network",
        interface="enp3s0",
        format_up = "Down:{bytes_recv:3.1f}MiB Up:{bytes_sent:2.1f}MiB",
        divisor=1024*1024,
        interval=4
        )

status.register("temp",
        format="CPU: {temp}°C"
        )

status.register("shell",
         command="nvidia-smi -i 0 -q -d TEMPERATURE | grep Current | awk '{ print $5 }'",
         format="GPU: {output}°C"
        )

status.register("cpu_usage",
        format="CPU: {usage:02}%",
        interval=4
        )

status.register("load",
        format="load: {avg1}:{avg5}"
        )

status.register("mem",
        format="Mem {percent_used_mem}%"
        )

status.register("disk",
        path='/',
        format="root {used}/{total}Gib"
        )

status.register("disk",
        path='/home/',
        format="home {used}/{total}Gib"
        )


status.run()
