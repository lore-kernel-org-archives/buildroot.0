From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  4 Aug 2019 08:41:48 +0200
Subject: [Buildroot] [PATCH 05/18] package/enscript: add license hash
In-Reply-To: <20190804064201.10667-1-bernd.kuhls@t-online.de>
References: <20190804064201.10667-1-bernd.kuhls@t-online.de>
Message-ID: <20190804064201.10667-5-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/enscript/enscript.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/enscript/enscript.hash b/package/enscript/enscript.hash
index 8b7694d408..4c50a165ac 100644
--- a/package/enscript/enscript.hash
+++ b/package/enscript/enscript.hash
@@ -1,2 +1,4 @@
 # Locally calculated after checking pgp signature
 sha256	6d56bada6934d055b34b6c90399aa85975e66457ac5bf513427ae7fc77f5c0bb	enscript-1.6.6.tar.gz
+# Locally computed
+sha256	fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7	COPYING
-- 
2.20.1
