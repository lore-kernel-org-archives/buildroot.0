From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 8 Apr 2020 13:33:53 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] docs/manual: minor typo
 fix
Message-ID: <20200408112033.A071F8DA29@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0a089edb6ba3a4021b7c70103168be78b03e6c79
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Definition of LIBFOO_USERS actually ends on 33rd line.

Signed-off-by: Naz??m Gediz Ayd??ndo??mu?? <gediz.aydindogmus@genemek.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 61f01794c806fc5e4e225436bff49be9febf6c23)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/adding-packages-generic.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index e875f9b76a..9fbc368129 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -142,7 +142,7 @@ All these steps rely on the +$(@D)+ variable, which
 contains the directory where the source code of the package has been
 extracted.
 
-On lines 31..43, we define a user that is used by this package (e.g.
+On lines 31..33, we define a user that is used by this package (e.g.
 to run a daemon as non-root) (+LIBFOO_USERS+).
 
 On line 35..37, we define a device-node file used by this package
