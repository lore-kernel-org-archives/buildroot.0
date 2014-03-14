From: rc.lsw.collaborate at gmail.com <rc.lsw.collaborate@gmail.com>
Date: Fri, 14 Mar 2014 17:58:18 -0500
Subject: [Buildroot] [PATCH v2] pyrex: new host package
Message-ID: <1394837899-14937-1-git-send-email-rc.lsw.collaborate@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: mlweber <mlweber@localhost>

This patch is a revision of the v1, found here:
http://patchwork.ozlabs.org/patch/276585/

For v2, I made a first attempt at making this a host only pkg. Feedback would
be much appreciated since being a host only package a Config.in.host was
used and I still included it in the normal Python submenu as that seemed to
be the clearest location.  Also in the naming of the menu entry I provided
a "(host tool)" for clarification.

Thanks!

Matt Weber (1):
  pyrex: new package

 package/Config.in                    |    1 +
 package/python-pyrex/Config.in.host  |    7 +++++++
 package/python-pyrex/python-pyrex.mk |   15 +++++++++++++++
 3 files changed, 23 insertions(+)
 create mode 100644 package/python-pyrex/Config.in.host
 create mode 100644 package/python-pyrex/python-pyrex.mk

--
1.7.9.5
