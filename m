From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Oct 2015 23:33:14 +0100
Subject: [Buildroot] [git commit] skeleton: sync /etc/shadow with /etc/passwd
Message-ID: <20151028224140.C792381F4D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0110ffe7b50dbfc892172fb4e064d2538acb1852
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Synchronize /etc/shadow with /etc/passwd:
  - remove "halt" and "uucp"
  - add "sys", "mail" and "www-data"

Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 system/skeleton/etc/shadow |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/system/skeleton/etc/shadow b/system/skeleton/etc/shadow
index 2ac2607..06778f1 100644
--- a/system/skeleton/etc/shadow
+++ b/system/skeleton/etc/shadow
@@ -1,8 +1,9 @@
 root::10933:0:99999:7:::
-bin:*:10933:0:99999:7:::
 daemon:*:10933:0:99999:7:::
+bin:*:10933:0:99999:7:::
+sys:*:10933:0:99999:7:::
 sync:*:10933:0:99999:7:::
-halt:*:10933:0:99999:7:::
-uucp:*:10933:0:99999:7:::
+mail:*:10933:0:99999:7:::
+www-data:*:10933:0:99999:7:::
 operator:*:10933:0:99999:7:::
 nobody:*:10933:0:99999:7:::
