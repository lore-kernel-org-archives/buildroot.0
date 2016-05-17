From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 May 2016 23:23:49 +0200
Subject: [Buildroot] [PATCH 2/3] flann: add hash file
In-Reply-To: <1463520230-6127-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1463520230-6127-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1463520230-6127-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

flann is fetched from Github, so we can add a hash file for this
package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/flann/flann.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/flann/flann.hash

diff --git a/package/flann/flann.hash b/package/flann/flann.hash
new file mode 100644
index 0000000..08242eb
--- /dev/null
+++ b/package/flann/flann.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 3fec86866987c792c3fce7ecc8ba9d09a003f5d2d1a1ad94864550aad73a5c0b  flann-3645f0c30a47267e56e5acdecfc7bac2b76bc3d5.tar.gz
-- 
2.7.4
