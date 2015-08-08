From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:57:52 -0000
Subject: [Buildroot] [git commit branch/next] proftpd: add hash file
Message-ID: <20150808105634.B68C27FC31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3ca8f8913140e36cdb6e7fc7fcda480c274b39cf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/proftpd/proftpd.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/proftpd/proftpd.hash b/package/proftpd/proftpd.hash
new file mode 100644
index 0000000..183e824
--- /dev/null
+++ b/package/proftpd/proftpd.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	c198b53991ce641eae6b3237e856e59f0bfe8330794145b49cae33f85b6f5370	proftpd-1.3.4d.tar.gz
