From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 21 Sep 2019 23:05:29 +0200
Subject: [Buildroot] [git commit] package/python-mako: add hash for license
 file
Message-ID: <20190921210032.C5DDC8F0BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b855a796012e842f604bf36ffef3c5bab4e5c94a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-mako/python-mako.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-mako/python-mako.hash b/package/python-mako/python-mako.hash
index 6a64ec3123..a0750cf8a2 100644
--- a/package/python-mako/python-mako.hash
+++ b/package/python-mako/python-mako.hash
@@ -1,3 +1,5 @@
 # md5 from https://pypi.python.org/pypi/mako/json, sha256 locally computed
 md5 a28e22a339080316b2acc352b9ee631c Mako-1.0.6.tar.gz
 sha256 48559ebd872a8e77f92005884b3d88ffae552812cdf17db6768e5c3be5ebbe0d Mako-1.0.6.tar.gz
+# License files, locally computed
+sha256 84f6f8798990239d697b6d62631dc402962d4fb3895955ea926dce7956baf71b LICENSE
