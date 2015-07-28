From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:40:13 -0300
Subject: [Buildroot] [PATCH 072/113] php-geoip: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-72-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/php-geoip/php-geoip.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/php-geoip/php-geoip.hash

diff --git a/package/php-geoip/php-geoip.hash b/package/php-geoip/php-geoip.hash
new file mode 100644
index 0000000..275a098
--- /dev/null
+++ b/package/php-geoip/php-geoip.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	82c6deb7264d2ff7c4d6c45a7d27cff7ab097be965795e317e04a9c5b7be98b9	geoip-1.1.0.tgz
-- 
2.3.6
