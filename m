From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 May 2019 00:26:25 +0200
Subject: [Buildroot] [git commit branch/next] package/intltool: add hash for
 license file
Message-ID: <20190530223346.A083D8E72C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4158585c1314193ddb22a6951aec38b434ac260b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/intltool/intltool.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/intltool/intltool.hash b/package/intltool/intltool.hash
index f6f41dc709..de1df87bc7 100644
--- a/package/intltool/intltool.hash
+++ b/package/intltool/intltool.hash
@@ -3,3 +3,4 @@ md5	12e517cac2b57a0121cda351570f1e63 intltool-0.51.0.tar.gz
 
 # Locally calculated
 sha256 67c74d94196b153b774ab9f89b2fa6c6ba79352407037c8c14d5aeb334e959cd  intltool-0.51.0.tar.gz
+sha256 32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
