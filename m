From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 17 Sep 2014 11:20:00 -0300
Subject: [Buildroot] [PATCH 02/11] polarssl: add hash
In-Reply-To: <1410963609-18128-1-git-send-email-gustavo@zacarias.com.ar>
References: <1410963609-18128-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1410963609-18128-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/polarssl/polarssl.hash | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 package/polarssl/polarssl.hash

diff --git a/package/polarssl/polarssl.hash b/package/polarssl/polarssl.hash
new file mode 100644
index 0000000..ca437ac
--- /dev/null
+++ b/package/polarssl/polarssl.hash
@@ -0,0 +1,3 @@
+# From https://polarssl.org/tech-updates/releases/polarssl-1.2.11-released
+sha1	40cb3a833245273946c2075e6c948bbcda8a1be9	polarssl-1.2.11-gpl.tgz
+sha256	b3e9d059c687980976b468d8260f658e9003aede1dbc4a918526e90abdaa7d75	polarssl-1.2.11-gpl.tgz
-- 
1.8.5.5
