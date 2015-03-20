From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Mar 2015 14:24:20 +0100
Subject: [Buildroot] [git commit] gpsd: add hash file
Message-ID: <20150320132801.DAA6B8188F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1c58da6c53b4da5c71e1c40ee491e1ea6cf3281d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gpsd/gpsd.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/gpsd/gpsd.hash b/package/gpsd/gpsd.hash
new file mode 100644
index 0000000..80703c1
--- /dev/null
+++ b/package/gpsd/gpsd.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	ed66c6b6b1e2b4951de2c0b2399c22f77fe9f5927ef6b948dd8eb023ff53b7ee	gpsd-3.11.tar.gz
