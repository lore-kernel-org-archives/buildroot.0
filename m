From: Peter Seiderer <ps.report@gmx.net>
Date: Fri,  2 Mar 2018 20:34:34 +0100
Subject: [Buildroot] [Patch next v2 0/3] Fixes for qt5: bump latest version
 to 5.10.1
Message-ID: <20180302193437.15573-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some fixes for the 'qt5: bump latest version to  5.10.1' patch
from Ga?l Portray.

Peter Seiderer (3):
  sqlite: add option for meta-data about tables/queries
  qt5base: fix Qt5.10.1 sqlite plugin compile failure
  qt5multimedia: fix Qt5.10.1 target installation


Peter Seiderer (3):
  sqlite: add option for meta-data about tables/queries
  qt5base: fix Qt5.10.1 sqlite plugin compile failure
  qt5multimedia: fix Qt5.10.1 target installation

 package/qt5/qt5base/Config.in              | 1 +
 package/qt5/qt5multimedia/qt5multimedia.mk | 6 ++++--
 package/sqlite/Config.in                   | 7 +++++++
 package/sqlite/sqlite.mk                   | 4 ++++
 4 files changed, 16 insertions(+), 2 deletions(-)

-- 
2.16.2
