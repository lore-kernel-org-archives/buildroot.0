From: aduskett at gmail.com <aduskett@gmail.com>
Date: Tue, 28 May 2019 23:35:28 -0400
Subject: [Buildroot] [PATCH 10/19] package/intltool: add hash for license
 file
In-Reply-To: <20190529033537.128311-1-aduskett@gmail.com>
References: <20190529033537.128311-1-aduskett@gmail.com>
Message-ID: <20190529033537.128311-11-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/intltool/intltool.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/intltool/intltool.hash b/package/intltool/intltool.hash
index f6f41dc709..de1df87bc7 100644
--- a/package/intltool/intltool.hash
+++ b/package/intltool/intltool.hash
@@ -3,3 +3,4 @@ md5	12e517cac2b57a0121cda351570f1e63 intltool-0.51.0.tar.gz
 
 # Locally calculated
 sha256 67c74d94196b153b774ab9f89b2fa6c6ba79352407037c8c14d5aeb334e959cd  intltool-0.51.0.tar.gz
+sha256 32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
-- 
2.21.0
