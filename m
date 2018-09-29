From: Gilles Talis <gilles.talis@gmail.com>
Date: Sat, 29 Sep 2018 17:09:02 +0200
Subject: [Buildroot] [PATCH 4/6] ocrad: add license hash
In-Reply-To: <1538233744-7607-1-git-send-email-gilles.talis@gmail.com>
References: <1538233744-7607-1-git-send-email-gilles.talis@gmail.com>
Message-ID: <1538233744-7607-5-git-send-email-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/ocrad/ocrad.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ocrad/ocrad.hash b/package/ocrad/ocrad.hash
index 5f093d2..5cde4d3 100644
--- a/package/ocrad/ocrad.hash
+++ b/package/ocrad/ocrad.hash
@@ -1,2 +1,3 @@
 # Locally calculated after checking pgp signature
 sha256 c383d37869baa0990d38d38836d4d567e9e2862aa0cd704868b62dafeac18e3c  ocrad-0.26.tar.lz
+sha256 3d77c1a58fbde5ddba612d1fe09965e20a3804953eca12e8c1892298bb8a5eef  COPYING
-- 
2.7.4
