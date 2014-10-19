From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Oct 2014 17:35:54 +0200
Subject: [Buildroot] [git commit] acl: add hash file
Message-ID: <20141019153637.9DA17AF9BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2daed9c71a9b9727e1aeb6949489ed62ed073e8e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/acl/acl.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/acl/acl.hash b/package/acl/acl.hash
new file mode 100644
index 0000000..3f9d790
--- /dev/null
+++ b/package/acl/acl.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	179074bb0580c06c4b4137be4c5a92a701583277967acdb5546043c7874e0d23	acl-2.2.52.src.tar.gz
