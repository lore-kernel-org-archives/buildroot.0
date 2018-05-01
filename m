From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  1 May 2018 21:45:38 +0200
Subject: [Buildroot] [PATCH 1/1] prosody: add hash for license file
Message-ID: <20180501194538.25825-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/prosody/prosody.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/prosody/prosody.hash b/package/prosody/prosody.hash
index d560994566..898d21814f 100644
--- a/package/prosody/prosody.hash
+++ b/package/prosody/prosody.hash
@@ -3,3 +3,6 @@ md5    0eebf7a18ce1fc7dd9954c94ebd85f54  prosody-0.10.0.tar.gz
 sha1   57c1c5a665e6453bdde06727ef398cd69accd9d7  prosody-0.10.0.tar.gz
 sha256 7414e447256c60b2645578c4a5913113cd74b419ca5a032b54db90d98a978498  prosody-0.10.0.tar.gz
 sha512 ee66e240afba6a8cb286623da48d9b535798153fb65e32070cec93aafe360e91f7087eeb49dec0f7d145e24f04339ed0878e50835b52f682130b204e22990ce9  prosody-0.10.0.tar.gz
+
+# Hash for license file:
+sha256 bbbdc1c5426e5944cf869fc0faeaf19d88a220cd2b39ea98b7b8e86b0e88a2ef  COPYING
-- 
2.14.1
