From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 18 Jun 2016 18:43:09 +0200
Subject: [Buildroot] [PATCH 09/19] package/ktap: add .hash file
In-Reply-To: <1466268199-5417-1-git-send-email-romain.naour@gmail.com>
References: <1466268199-5417-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1466268199-5417-9-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Similar to jquery-keyboard, it seems the ktap tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to
our s.b.o mirror.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/ktap/ktap.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/ktap/ktap.hash

diff --git a/package/ktap/ktap.hash b/package/ktap/ktap.hash
new file mode 100644
index 0000000..d58bd85
--- /dev/null
+++ b/package/ktap/ktap.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 bc8b03a53c430ae4fcf594ffdf31e2b2ed47a8fee25dd8fea60aa34f75441707  ktap-eb66d40310c93dc82bc8eac889744c1ed1f01f7b.tar.gz
-- 
2.5.5
