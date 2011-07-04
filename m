From: Sven Neumann <s.neumann@raumfeld.com>
Date: Mon,  4 Jul 2011 15:54:39 +0200
Subject: [Buildroot] patches for gstreamer packages
Message-ID: <1309787685-22269-1-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi,

here are a couple of patches that clean up gstreamer related packages.
In particular the configurations are updated to follow upstream changes
in gst-plugins-base and gst-plugins-bad. There's also a patch that adds
the orc package which is the successor of liboil.

There are some more changes needed to finish this cleanup. But I'd like
to get some feedback before I put more time into this.


Sven
