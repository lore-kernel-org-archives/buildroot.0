From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 29 Apr 2018 17:05:53 +0200
Subject: [Buildroot] [PATCH 1/1] libesmtp: add hash for license files
Message-ID: <20180429150553.8036-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libesmtp/libesmtp.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libesmtp/libesmtp.hash b/package/libesmtp/libesmtp.hash
index c9c0fa303e..9e1ca22b5b 100644
--- a/package/libesmtp/libesmtp.hash
+++ b/package/libesmtp/libesmtp.hash
@@ -1,2 +1,4 @@
 # Locally calculated
 sha256	d0a61a5c52d99fa7ce7d00ed0a07e341dbda67101dbed1ab0cdae3f37db4eb0b	libesmtp-1.0.6.tar.bz2
+sha256	32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670	COPYING
+sha256	f18a0811fa0e220ccbc42f661545e77f0388631e209585ed582a1c693029c6aa	COPYING.LIB
-- 
2.14.1
