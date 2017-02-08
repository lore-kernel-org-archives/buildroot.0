From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Wed,  8 Feb 2017 11:26:33 +0100
Subject: [Buildroot] [PATCH v2 0/2] Qt5 submenu updates
Message-ID: <1486549595-15691-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patchset removes the 'deprecated' section from the Qt5 submenu
and adds hints to the help text about the tech preview/deprecated status
of the modules as proposed by Thomas and also adds extended help texts to the various
Qt5 modules, as proposed by Arnout.

v2: Add mentioning of tech preview status as well

Zoltan Gyarmati (2):
  remove menu comment about deprecated modules
  package/qt5/*: add meaningful help texts and package URLs

 package/qt5/Config.in                     | 7 +++----
 package/qt5/qt53d/Config.in               | 4 ++++
 package/qt5/qt5canvas3d/Config.in         | 5 +++--
 package/qt5/qt5connectivity/Config.in     | 6 ++++--
 package/qt5/qt5declarative/Config.in      | 6 ++++--
 package/qt5/qt5enginio/Config.in          | 8 ++++++--
 package/qt5/qt5graphicaleffects/Config.in | 6 ++++--
 package/qt5/qt5imageformats/Config.in     | 5 +++--
 package/qt5/qt5location/Config.in         | 6 ++++--
 package/qt5/qt5multimedia/Config.in       | 7 +++++--
 package/qt5/qt5quickcontrols/Config.in    | 5 +++--
 package/qt5/qt5quickcontrols2/Config.in   | 5 ++++-
 package/qt5/qt5script/Config.in           | 5 +++--
 package/qt5/qt5sensors/Config.in          | 5 +++--
 package/qt5/qt5serialbus/Config.in        | 5 ++++-
 package/qt5/qt5serialport/Config.in       | 6 ++++--
 package/qt5/qt5svg/Config.in              | 5 +++--
 package/qt5/qt5tools/Config.in            | 5 +++--
 package/qt5/qt5webchannel/Config.in       | 6 ++++--
 package/qt5/qt5webkit/Config.in           | 6 ++++--
 package/qt5/qt5websockets/Config.in       | 7 +++++--
 package/qt5/qt5x11extras/Config.in        | 5 +++--
 package/qt5/qt5xmlpatterns/Config.in      | 5 +++--
 23 files changed, 86 insertions(+), 44 deletions(-)

-- 
2.7.4
