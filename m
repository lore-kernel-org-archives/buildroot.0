From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 20 Mar 2018 18:17:38 +0100
Subject: [Buildroot] [PATCH v2 00/22] bump various x11r7 packages
Message-ID: <20180320171800.3447-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

v2 contains no code changes. I sent v2 hoping that patchworks now
catches the whole series.

Regards, Bernd

Bernd Kuhls (22):
  package/x11r7/xapp_ico: bump version to 1.0.5
  package/x11r7/xapp_xbacklight: bump version to 1.2.2
  package/x11r7/xapp_xeyes: bump version to 1.1.2
  package/x11r7/xapp_xfontsel: bump version to 1.0.6
  package/x11r7/xapp_xinit: bump version to 1.4.0
  package/x11r7/xapp_xkill: bump version to 1.0.5
  package/x11r7/xapp_xload: bump version to 1.1.3
  package/x11r7/xapp_xlsclients: bump version to 1.1.4
  package/x11r7/xapp_xlsfonts: bump version to 1.0.6
  package/x11r7/xapp_xmessage: bump version to 1.0.5
  package/x11r7/xapp_xpr: bump version to 1.0.5
  package/x11r7/xapp_xprop: bump version to 1.2.3
  package/x11r7/xapp_xrdb: bump version to 1.1.1
  package/x11r7/xapp_xrefresh: bump version to 1.0.6
  package/x11r7/xapp_xset: bump version to 1.2.4
  package/x11r7/xapp_xsetroot: bump version to 1.1.2
  package/x11r7/xapp_xsm: bump version to 1.0.4
  package/x11r7/xapp_xwd: bump version to 1.0.7
  package/x11r7/xapp_xwininfo: bump version to 1.1.4
  package/x11r7/xapp_xwud: bump version to 1.0.5
  package/x11r7/xdata_xbitmaps: bump version to 1.1.2
  package/x11r7/xdata_xcursor-themes: bump version to 1.0.5

 package/x11r7/xapp_ico/xapp_ico.hash                         | 9 +++++++--
 package/x11r7/xapp_ico/xapp_ico.mk                           | 2 +-
 package/x11r7/xapp_xbacklight/xapp_xbacklight.hash           | 9 +++++++--
 package/x11r7/xapp_xbacklight/xapp_xbacklight.mk             | 2 +-
 package/x11r7/xapp_xeyes/xapp_xeyes.hash                     | 9 +++++++--
 package/x11r7/xapp_xeyes/xapp_xeyes.mk                       | 2 +-
 package/x11r7/xapp_xfontsel/xapp_xfontsel.hash               | 9 +++++++--
 package/x11r7/xapp_xfontsel/xapp_xfontsel.mk                 | 2 +-
 package/x11r7/xapp_xinit/xapp_xinit.hash                     | 9 +++++++--
 package/x11r7/xapp_xinit/xapp_xinit.mk                       | 2 +-
 package/x11r7/xapp_xkill/xapp_xkill.hash                     | 9 +++++++--
 package/x11r7/xapp_xkill/xapp_xkill.mk                       | 2 +-
 package/x11r7/xapp_xload/xapp_xload.hash                     | 9 +++++++--
 package/x11r7/xapp_xload/xapp_xload.mk                       | 2 +-
 package/x11r7/xapp_xlsclients/xapp_xlsclients.hash           | 9 +++++++--
 package/x11r7/xapp_xlsclients/xapp_xlsclients.mk             | 2 +-
 package/x11r7/xapp_xlsfonts/xapp_xlsfonts.hash               | 9 +++++++--
 package/x11r7/xapp_xlsfonts/xapp_xlsfonts.mk                 | 2 +-
 package/x11r7/xapp_xmessage/xapp_xmessage.hash               | 9 +++++++--
 package/x11r7/xapp_xmessage/xapp_xmessage.mk                 | 2 +-
 package/x11r7/xapp_xpr/xapp_xpr.hash                         | 9 +++++++--
 package/x11r7/xapp_xpr/xapp_xpr.mk                           | 2 +-
 package/x11r7/xapp_xprop/xapp_xprop.hash                     | 9 +++++++--
 package/x11r7/xapp_xprop/xapp_xprop.mk                       | 2 +-
 package/x11r7/xapp_xrdb/xapp_xrdb.hash                       | 9 +++++++--
 package/x11r7/xapp_xrdb/xapp_xrdb.mk                         | 2 +-
 package/x11r7/xapp_xrefresh/xapp_xrefresh.hash               | 9 +++++++--
 package/x11r7/xapp_xrefresh/xapp_xrefresh.mk                 | 2 +-
 package/x11r7/xapp_xset/xapp_xset.hash                       | 9 +++++++--
 package/x11r7/xapp_xset/xapp_xset.mk                         | 2 +-
 package/x11r7/xapp_xsetroot/xapp_xsetroot.hash               | 9 +++++++--
 package/x11r7/xapp_xsetroot/xapp_xsetroot.mk                 | 2 +-
 package/x11r7/xapp_xsm/xapp_xsm.hash                         | 9 +++++++--
 package/x11r7/xapp_xsm/xapp_xsm.mk                           | 2 +-
 package/x11r7/xapp_xwd/xapp_xwd.hash                         | 9 +++++++--
 package/x11r7/xapp_xwd/xapp_xwd.mk                           | 2 +-
 package/x11r7/xapp_xwininfo/xapp_xwininfo.hash               | 9 +++++++--
 package/x11r7/xapp_xwininfo/xapp_xwininfo.mk                 | 2 +-
 package/x11r7/xapp_xwud/xapp_xwud.hash                       | 9 +++++++--
 package/x11r7/xapp_xwud/xapp_xwud.mk                         | 2 +-
 package/x11r7/xdata_xbitmaps/xdata_xbitmaps.hash             | 9 +++++++--
 package/x11r7/xdata_xbitmaps/xdata_xbitmaps.mk               | 2 +-
 package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.hash | 9 +++++++--
 package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk   | 2 +-
 44 files changed, 176 insertions(+), 66 deletions(-)

-- 
2.11.0
