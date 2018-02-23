From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 23 Feb 2018 19:38:27 +0100
Subject: [Buildroot] [Patch next v1 0/3] Fixes for qt5: bump latest version
 to 5.10.1
Message-ID: <20180223183830.16768-1-ps.report@gmx.net>
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

 package/qt5/qt5base/Config.in              | 1 +
 package/qt5/qt5multimedia/qt5multimedia.mk | 4 +++-
 package/sqlite/Config.in                   | 7 +++++++
 package/sqlite/sqlite.mk                   | 4 ++++
 4 files changed, 15 insertions(+), 1 deletion(-)

-- 
2.16.2
