From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Jun 2017 14:29:28 +0200
Subject: [Buildroot] [git commit] package/edid-decode: add hash
Message-ID: <20170611123753.224187FB85@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=74064e41fe2c14b3999244b5db30516dd598aff7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/edid-decode/edid-decode.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/edid-decode/edid-decode.hash b/package/edid-decode/edid-decode.hash
new file mode 100644
index 0000000..0c2c6a2
--- /dev/null
+++ b/package/edid-decode/edid-decode.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 ec85b62e863a1ad4636e1a216c122e459d7847c71ff6d57e4bf44406d9cbeb40  edid-decode-681153145d5e05ee15032ea792e967cda06e7622.tar.gz
