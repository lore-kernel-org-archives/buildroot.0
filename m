From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 18 Jun 2020 23:30:52 +0200
Subject: [Buildroot] [git commit] support/scripts/pkg-stats: remove debug
 cruft
Message-ID: <20200618212927.2922F7F9A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=45b174c8ad01f2e95e8aa86958e78b05ef2705bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/pkg-stats | 2 --
 1 file changed, 2 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 4d76ca32f9..c1f41fc9e8 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -383,8 +383,6 @@ class CVE:
                     if not hasattr(cve_affected_version, "version"):
                         print("Cannot parse CVE affected version '%s'" % v["version_value"])
                         continue
-                    print(pkg_version)
-                    print(cve_affected_version)
                     return pkg_version <= cve_affected_version
                 else:
                     print("version_affected: %s" % v['version_affected'])
