From: Valentine Barshak <gvaxon@gmail.com>
Date: Wed, 26 Sep 2012 23:31:55 +0400
Subject: [Buildroot] [PATCH 0/3] Fix libdvdread and libdvdnav support
Message-ID: <20120926193155.GA3942@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following patches fix dvdread-config and dvdnav-config
scripts installed to staging directory and make mplayer
use these libraries when they are enabled.

This is done to add DVD support to mplyaer.
These patches have been tested on an x86 machine.

Thanks,
Val.
