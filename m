From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Jan 2015 19:26:42 +0100
Subject: [Buildroot] [git commit] mysql: add hash
Message-ID: <20150114182713.7976B807CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1923f2f9f240526572def45c04db742690f59f36
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mysql/mysql.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/mysql/mysql.hash b/package/mysql/mysql.hash
new file mode 100644
index 0000000..84f3361
--- /dev/null
+++ b/package/mysql/mysql.hash
@@ -0,0 +1,2 @@
+# From https://downloads.mariadb.com/archives/mysql-5.1/mysql-5.1.73.tar.gz.md5
+md5	887f869bcc757957067b9198f707f32f	mysql-5.1.73.tar.gz
