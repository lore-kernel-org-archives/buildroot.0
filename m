From: Sven Neumann <s.neumann@raumfeld.com>
Date: Tue, 27 Sep 2011 10:04:12 +0200
Subject: [Buildroot] Segmentation faults after gcc update
Message-ID: <1317110841.20688.12.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

we are using buildroot successfully for quite a while now and after I've
recently managed to bring our buildroot environment up-to-date with
current git, I've changed the gcc version from 4.3.6 to 4.6.1. That was
the only change to the config. The resulting image boots and some
services (syslogd, klogd, udevd, sshd) are up and running. I can log
into the system and the busybox tools I tried to far seem to work fine.
However lots of applications that used to run fine now immidiately die
with a segmentation fault:

# dbus-daemon 
Segmentation fault

# uuidgen
Segmentation fault

# sqlite3
Segmentation fault

# iperf
Segmentation fault

What could possibly be wrong here? Is there anything else I need to
change when changing the version of gcc?


Sven
