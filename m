From: =?iso-8859-9?q?Naz=FDm_Gediz_AYDINDO=D0MU=DE?= <gediz.aydindogmus@genemek.com>
Date: Thu, 2 Apr 2020 12:41:12 +0000
Subject: [Buildroot] [PATCH 1/1] docs/manual: minor typo fix
Message-ID: <a7c96e3f84a64afda9548fd5f535d40f@genemek.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Definition of LIBFOO_USERS actually ends on 33rd line.

Signed-off-by: Naz?m Gediz Ayd?ndo?mu? <gediz.aydindogmus@genemek.com>
---
docs/manual/adding-packages-generic.txt | 2 +-
1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/adding-packages-generic.txt
b/docs/manual/adding-packages-generic.txt
index 8ee51ca57d..ed1e6acf57 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -142,7 +142,7 @@ All these steps rely on the +$(@D)+ variable, which
contains the directory where the source code of the package has been
extracted.

-On lines 31..43, we define a user that is used by this package (e.g.
+On lines 31..33, we define a user that is used by this package (e.g.
to run a daemon as non-root) (+LIBFOO_USERS+).

On line 35..37, we define a device-node file used by this package
-- 
2.17.1
