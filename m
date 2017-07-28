From: Joshua Henderson <joshua.henderson@microchip.com>
Date: Fri, 28 Jul 2017 14:53:19 -0700
Subject: [Buildroot] [PATCH] package/qt5location: isolate patch to qt 5.9.1
Message-ID: <1501278799-22827-1-git-send-email-joshua.henderson@microchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes a build issue [1] where the qt5location upstream patch should only be
applied to 5.9.1.  This moves the patch into the appropriate directory.

[1] http://autobuild.buildroot.net/results/676abe008c9c4bddfddd7b041d8db9999e9e899d

Cc: Julien Corjon <corjon.j@ecagroup.com>
Cc: Peter Seiderer <ps.report@gmx.net>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
---
 .../qt5/qt5location/{ => 5.9.1}/0001-Fix-plugins-build-dependency.patch   | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename package/qt5/qt5location/{ => 5.9.1}/0001-Fix-plugins-build-dependency.patch (100%)

diff --git a/package/qt5/qt5location/0001-Fix-plugins-build-dependency.patch b/package/qt5/qt5location/5.9.1/0001-Fix-plugins-build-dependency.patch
similarity index 100%
rename from package/qt5/qt5location/0001-Fix-plugins-build-dependency.patch
rename to package/qt5/qt5location/5.9.1/0001-Fix-plugins-build-dependency.patch
-- 
2.7.4
