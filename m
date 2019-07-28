From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 28 Jul 2019 22:44:29 +0200
Subject: [Buildroot] [PATCH 2/7] package/google-material-design-icons: add
 license hash
In-Reply-To: <20190728204434.12356-1-bernd.kuhls@t-online.de>
References: <20190728204434.12356-1-bernd.kuhls@t-online.de>
Message-ID: <20190728204434.12356-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Partly fixes:
http://autobuild.buildroot.net/results/f0f/f0fd05ce8a8b595015baf625481b58967df53458/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../google-material-design-icons.hash                            | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/google-material-design-icons/google-material-design-icons.hash b/package/google-material-design-icons/google-material-design-icons.hash
index 9a66336494..535eca8100 100644
--- a/package/google-material-design-icons/google-material-design-icons.hash
+++ b/package/google-material-design-icons/google-material-design-icons.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256  769547061a51f81623bf5174767c08fc587fd6946339592fbd6cd0dd45f56b4c  2.2.3.tar.gz
+sha256  8ae9438818c26e4873b91d8c6ad620526c011e27e125677f13031eda903f007c  LICENSE
-- 
2.20.1
