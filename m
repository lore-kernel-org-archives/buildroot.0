From: Spenser Gilliland <spenser@gillilanding.com>
Date: Thu,  9 May 2013 23:02:31 -0500
Subject: [Buildroot] Gstreamer 1.X Patches
Message-ID: <1368158558-6069-1-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The subsequent patches add Gstreamer 1.X to Buildroot. Gstreamer has many
dependencies which can be disabled or enabled as plugins.  For an example of
adding a plugin which requires a dependent library, see patches 6 and 7 of the
series.

v2 -> v3:
	fixes after running build all/none plugin components
	changed naming from gst-plugins-<blah>1 to gst1-plugins-<blah>
	options which require currently unpackged libraries are disabled

v1 -> v2:
	completed patch series by adding good, bad, and ugly plugins
