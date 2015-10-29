From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 29 Oct 2015 10:34:38 -0300
Subject: [Buildroot] [PATCH] lvm2: switch to stronger upstream hash
Message-ID: <1446125678-23556-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop md5 and calculated sha256 and switch to upstream-provided sha512.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/lvm2/lvm2.hash | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/lvm2/lvm2.hash b/package/lvm2/lvm2.hash
index 49a1655..c6a9ea1 100644
--- a/package/lvm2/lvm2.hash
+++ b/package/lvm2/lvm2.hash
@@ -1,4 +1,2 @@
-# From ftp://sources.redhat.com/pub/lvm2/md5.sum
-md5 80af5af726949bbbb2aceb15b24b7d20  LVM2.2.02.132.tgz
-# Locally calculated
-sha256 413aa09cd5babb2e01b0209ed4be514645fa8b492664f57f384352a7f58f8829  LVM2.2.02.132.tgz
+# From ftp://sources.redhat.com/pub/lvm2/releases/sha512.sum
+sha512	d5c695c9f3120d8e20845510f11204e6f8d13b6656a05c78f1b71482e97f63fd93ede54ec99cab14074421d3ecf6e501ec9e6581976ff266158f2910d25bbcf3	LVM2.2.02.132.tgz
-- 
2.4.10
