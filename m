From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Mar 2015 20:50:22 +0100
Subject: [Buildroot] [git commit] nginx: add hash file
Message-ID: <20150320195054.04515818AB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cdfce42046faba41eb1f19d03d86d789e7ca7d5c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nginx/nginx.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/nginx/nginx.hash b/package/nginx/nginx.hash
new file mode 100644
index 0000000..96e5fb2
--- /dev/null
+++ b/package/nginx/nginx.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	b5608c2959d3e7ad09b20fc8f9e5bd4bc87b3bc8ba5936a513c04ed8f1391a18	nginx-1.6.2.tar.gz
