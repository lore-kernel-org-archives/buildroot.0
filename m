From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 13 May 2015 09:31:27 +0300
Subject: [Buildroot] [PATCH 2/2] libmodbus: add hash
In-Reply-To: <5f820f3049a52d079c5900368eef6f4f7ba14a25.1431498687.git.baruch@tkos.co.il>
References: <5f820f3049a52d079c5900368eef6f4f7ba14a25.1431498687.git.baruch@tkos.co.il>
Message-ID: <03df678dce185be544d34be5b67ee285c7c6e2ba.1431498687.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libmodbus/libmodbus.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/libmodbus/libmodbus.hash

diff --git a/package/libmodbus/libmodbus.hash b/package/libmodbus/libmodbus.hash
new file mode 100644
index 000000000000..095164d61351
--- /dev/null
+++ b/package/libmodbus/libmodbus.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256	046d63f10f755e2160dc56ef681e5f5ad3862a57c1955fd82e0ce036b69471b6	libmodbus-3.0.6.tar.gz
-- 
2.1.4
