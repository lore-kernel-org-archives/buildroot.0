From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
Date: Sat, 18 Nov 2017 20:54:58 -0500
Subject: [Buildroot] [PATCH] netcat-openbsd: add source and license hashes
Message-ID: <20171119015458.6725-1-gael.portay@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
---
Hi,

Hashes have been locally computed.

Regards,
Gael

 package/netcat-openbsd/netcat-openbsd.hash | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 package/netcat-openbsd/netcat-openbsd.hash

diff --git a/package/netcat-openbsd/netcat-openbsd.hash b/package/netcat-openbsd/netcat-openbsd.hash
new file mode 100644
index 0000000000..58f229517e
--- /dev/null
+++ b/package/netcat-openbsd/netcat-openbsd.hash
@@ -0,0 +1,3 @@
+# Locally calculated from download
+sha256 f587c02139aedb0bae12fdaef94f8c00649a0b4d603b5a22612e42cb317ba7cf netcat-openbsd-debian_1.178-3.tar.gz
+sha256 e2e86d58c38f044a49f51e45515747585db58a2305419c73323eaad88fcaef5c debian/copyright
-- 
2.15.0
