From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 29 Apr 2018 16:18:22 +0200
Subject: [Buildroot] [git commit] libb64: add hash for license file
Message-ID: <20180429142028.C043D8821B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=789db63a94bc3358202f931a82f564ffb9a75028
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libb64/libb64.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libb64/libb64.hash b/package/libb64/libb64.hash
index 012a7b0b00..0ed8065f12 100644
--- a/package/libb64/libb64.hash
+++ b/package/libb64/libb64.hash
@@ -1,3 +1,6 @@
 # sha1 from sourceforge, sha256 locally computed
 sha1  04b3e21b8c951d27f02fe91249ca3474554af0b9  libb64-1.2.1.zip
 sha256  20106f0ba95cfd9c35a13c71206643e3fb3e46512df3e2efb2fdbf87116314b2  libb64-1.2.1.zip
+
+# Hash for license file:
+sha256  834b7afa1b3c40289a3be775d3625016be1c0d7ea7a4a26c1eb207f53dc961d8  LICENSE
