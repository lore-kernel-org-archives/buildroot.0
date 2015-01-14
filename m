From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Jan 2015 19:27:07 +0100
Subject: [Buildroot] [git commit] postgresql: add hash
Message-ID: <20150114182713.8197A807CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=382eeca0326f8511a0f23a747ae57d33943ca05a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/postgresql/postgresql.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
new file mode 100644
index 0000000..834eb30
--- /dev/null
+++ b/package/postgresql/postgresql.hash
@@ -0,0 +1,2 @@
+# From https://ftp.postgresql.org/pub/source/v9.4.0/postgresql-9.4.0.tar.bz2.sha256
+sha256	7a35c3cb77532f7b15702e474d7ef02f0f419527ee80a4ca6036fffb551625a5	postgresql-9.4.0.tar.bz2
