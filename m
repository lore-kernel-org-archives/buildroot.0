From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Jun 2016 23:30:53 +0200
Subject: [Buildroot] [git commit] fwup: add hash file
Message-ID: <20160612213103.2E80B803D8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3fb83a9e92cce92e820d1119574dc26ee4f1e8f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/fwup/fwup.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/fwup/fwup.hash b/package/fwup/fwup.hash
new file mode 100644
index 0000000..298c5db
--- /dev/null
+++ b/package/fwup/fwup.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	  b318875d42cf2a643da99f03ac91662ec91625d9a84a3a9bb53ac419d1cb0dc3	fwup-v0.7.0.tar.gz
