From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  9 Oct 2014 18:10:48 +0200
Subject: [Buildroot] [PATCH 5/5] libgeotiff: add hash file
In-Reply-To: <1412871048-28981-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1412871048-28981-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1412871048-28981-5-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libgeotiff/libgeotiff.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/libgeotiff/libgeotiff.hash

diff --git a/package/libgeotiff/libgeotiff.hash b/package/libgeotiff/libgeotiff.hash
new file mode 100644
index 0000000..66b8cb7
--- /dev/null
+++ b/package/libgeotiff/libgeotiff.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha1 4c6f405869826bb7d9f35f1d69167e3b44a57ef0 libgeotiff-1.4.0.tar.gz
-- 
2.0.0
