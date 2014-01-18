From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 18 Jan 2014 20:23:39 +0100
Subject: [Buildroot] [PATCH 02/10] transmission: add url in Config.in
In-Reply-To: <1390073027-14239-1-git-send-email-s.martin49@gmail.com>
References: <1390073027-14239-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1390073027-14239-3-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/transmission/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/transmission/Config.in b/package/transmission/Config.in
index 8d413c6..596b0ed 100644
--- a/package/transmission/Config.in
+++ b/package/transmission/Config.in
@@ -10,6 +10,8 @@ config BR2_PACKAGE_TRANSMISSION
 	help
 	  Transmission is a cross-platform BitTorrent client.
 
+	  https://trac.transmissionbt.com/
+
 if BR2_PACKAGE_TRANSMISSION
 
 config BR2_PACKAGE_TRANSMISSION_UTP
-- 
1.8.5.3
