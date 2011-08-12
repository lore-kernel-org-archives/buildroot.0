From: Sven Neumann <s.neumann@raumfeld.com>
Date: Fri, 12 Aug 2011 10:29:56 +0200
Subject: [Buildroot] /run/udev missing ?
Message-ID: <1313137798.1017.5.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

after updating to latest buildroot, udevd has problems starting:

udevd[1114]: error: runtime directory '/run/udev' not writable, for now
falling back to '/dev/.udev'
udevd[1114]: failed to create queue file: No such file or directory
udevd[1114]: error creating queue file

It looks like udevd is not running or not working properly then as it
fails to load the firmware for the Wifi chip.

This is a configuration with static device management.

Any ideas? Should /run/udev exist or is the fallback OK and supposed to
work?


Sven
