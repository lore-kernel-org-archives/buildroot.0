From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 29 Jul 2017 00:06:43 +0200
Subject: [Buildroot] [git commit] package/qt5location: isolate patch to
	qt5location 5.9.1
Message-ID: <20170728223914.9B1417FCEC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2697543f9e0e09ce631c34cc46d6d46dc3818dbc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The patch only applies to the 5.9.1 version, not 5.6.*.  This moves the
patch into the appropriate directory.

Fixes:
http://autobuild.buildroot.net/results/676abe008c9c4bddfddd7b041d8db9999e9e899d

Cc: Julien Corjon <corjon.j@ecagroup.com>
Cc: Peter Seiderer <ps.report@gmx.net>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
Reviewed-by: Peter Seiderer <ps.report@gmx.net>
[Arnout: slightly edit commit message]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../qt5/qt5location/{ => 5.9.1}/0001-Fix-plugins-build-dependency.patch   | 0
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/qt5/qt5location/0001-Fix-plugins-build-dependency.patch b/package/qt5/qt5location/5.9.1/0001-Fix-plugins-build-dependency.patch
similarity index 100%
rename from package/qt5/qt5location/0001-Fix-plugins-build-dependency.patch
rename to package/qt5/qt5location/5.9.1/0001-Fix-plugins-build-dependency.patch
