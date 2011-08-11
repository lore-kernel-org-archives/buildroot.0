From: Sven Neumann <s.neumann@raumfeld.com>
Date: Thu, 11 Aug 2011 16:32:27 +0200
Subject: [Buildroot] $udevroot
Message-ID: <1313073148.31365.9.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

we are facing some problems with device nodes since the udev update. Now
I am trying to understand how the whole device management works
nowadays.

First thing that made me wonder is the following output on startup:

Populating  using udev: done

This is from /etc/init.d/S10udev and it looks like $udevroot is not set
here. Is that just a cosmetic issue or an indicator that something is
severily broken?


Sven
