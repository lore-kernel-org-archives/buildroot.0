From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Mon,  3 Oct 2011 12:10:30 +0200
Subject: [Buildroot] [pull request v2] Pull request for branch
	for-2011.11/packages
Message-ID: <cover.1317636624.git.maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit 102a93bdca09742c99e110f144bf0c9267bbdd14:

  support: move package/gnuconfig to support/gnuconfig (2011-09-17 08:22:12 +0200)

are available in the git repository at:
  http://free-electrons.com/~maxime/git/buildroot.git for-2011.11/packages

Maxime Ripard (4):
      Add the picocom package
      Add Transmission package
      Add lame support in gstreamer
      Add the libplayer package

 package/Config.in                                  |    2 +
 package/multimedia/Config.in                       |    1 +
 package/multimedia/gst-plugins-ugly/Config.in      |    4 +
 .../gst-plugins-ugly/gst-plugins-ugly.mk           |    7 +
 package/multimedia/libplayer/Config.in             |   27 ++++
 package/multimedia/libplayer/libplayer.mk          |   44 ++++++
 package/picocom/Config.in                          |    9 +
 package/picocom/picocom.mk                         |   19 +++
 package/transmission/Config.in                     |   35 +++++
 package/transmission/S92transmission               |  161 ++++++++++++++++++++
 package/transmission/transmission.mk               |   47 ++++++
 11 files changed, 356 insertions(+), 0 deletions(-)
 create mode 100644 package/multimedia/libplayer/Config.in
 create mode 100644 package/multimedia/libplayer/libplayer.mk
 create mode 100644 package/picocom/Config.in
 create mode 100644 package/picocom/picocom.mk
 create mode 100644 package/transmission/Config.in
 create mode 100644 package/transmission/S92transmission
 create mode 100644 package/transmission/transmission.mk

Thanks,
-- 
Maxime Ripard
