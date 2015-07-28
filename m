From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jul 2015 22:37:12 +0200
Subject: [Buildroot] [git commit branch/next] read-edid: add hash file
Message-ID: <20150808105648.2749D80741@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7c7d06a24dd9adfdf7809abe0da0ab761d2c886f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/read-edid/read-edid.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/read-edid/read-edid.hash b/package/read-edid/read-edid.hash
new file mode 100644
index 0000000..2c5501c
--- /dev/null
+++ b/package/read-edid/read-edid.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	c1b5d839fe6349efc183b3a3d33a8be1cd0dfea3c94015a86159d8aaeb6e9dd7	read-edid-1.4.2.tar.gz
