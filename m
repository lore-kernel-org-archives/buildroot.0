From: Romain Naour <romain.naour@openwide.fr>
Date: Fri, 24 Apr 2015 21:46:10 +0200
Subject: [Buildroot] [PATCH 0/3] packages needed by the upcomming efl 1.14
	package
Message-ID: <1429904773-460-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This small series add some packages needed to build the upcomming 1.14 package.

Romain Naour (3):
  package/bullet: new package
  package/x11r7/xproto_printproto: new package
  package/x11r7/xlib_libXp: new package

 package/Config.in                                     |  1 +
 package/bullet/Config.in                              | 10 ++++++++++
 package/bullet/bullet.mk                              | 18 ++++++++++++++++++
 package/x11r7/Config.in                               |  2 ++
 package/x11r7/xlib_libXp/Config.in                    |  8 ++++++++
 package/x11r7/xlib_libXp/xlib_libXp.hash              |  2 ++
 package/x11r7/xlib_libXp/xlib_libXp.mk                | 19 +++++++++++++++++++
 package/x11r7/xproto_printproto/Config.in             |  6 ++++++
 .../x11r7/xproto_printproto/xproto_printproto.hash    |  2 ++
 package/x11r7/xproto_printproto/xproto_printproto.mk  | 15 +++++++++++++++
 10 files changed, 83 insertions(+)
 create mode 100644 package/bullet/Config.in
 create mode 100644 package/bullet/bullet.mk
 create mode 100644 package/x11r7/xlib_libXp/Config.in
 create mode 100644 package/x11r7/xlib_libXp/xlib_libXp.hash
 create mode 100644 package/x11r7/xlib_libXp/xlib_libXp.mk
 create mode 100644 package/x11r7/xproto_printproto/Config.in
 create mode 100644 package/x11r7/xproto_printproto/xproto_printproto.hash
 create mode 100644 package/x11r7/xproto_printproto/xproto_printproto.mk

-- 
1.9.3
