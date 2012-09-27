From: Valentine Barshak <gvaxon@gmail.com>
Date: Thu, 27 Sep 2012 22:13:06 +0400
Subject: [Buildroot] [PATCH 0/3] Fix libdvdread and libdvdnav support v2
Message-ID: <20120927181306.GA21215@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following patches fix dvdread-config and dvdnav-config
scripts installed to staging directory and make mplayer
use these libraries when they are enabled.
Otherwise DVD support is disabled in mplayer config.

This is the updated patch set, that has the comments
by Thomas Petazzoni addressed.

These patches have been tested on an x86 machine.

Thanks,
Val.
