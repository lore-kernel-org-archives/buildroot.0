From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Jul 2020 21:30:39 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/readline: update
 homepage link
Message-ID: <20200715192703.20B0986FB1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=09fe38e866f0481d64da07e1ed7294dedca04c35
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

The old link is dead since 2017.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 60b1cb9d473e3d3202a967e1b9d51011b8fb42ac)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/readline/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/readline/Config.in b/package/readline/Config.in
index 1cb0672cf1..7021472623 100644
--- a/package/readline/Config.in
+++ b/package/readline/Config.in
@@ -6,4 +6,4 @@ config BR2_PACKAGE_READLINE
 	  by applications that allow users to edit command lines
 	  as they are typed in.
 
-	  https://cnswww.cns.cwru.edu/php/chet/readline/rltop.html
+	  https://tiswww.case.edu/php/chet/readline/rltop.html
