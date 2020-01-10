From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 10 Jan 2020 15:08:02 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] docs/manual: fix typo
Message-ID: <20200110135931.539178854B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=04f069286859e18e8d706eb74368edaa1676750b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

Reported-by: Dan Walkes <danwalkes@trellis-logic.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 1c1e9e491efef17065f33fb987f414435ac5831b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/rebuilding-packages.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/rebuilding-packages.txt b/docs/manual/rebuilding-packages.txt
index 621493776c..06d3855148 100644
--- a/docs/manual/rebuilding-packages.txt
+++ b/docs/manual/rebuilding-packages.txt
@@ -65,7 +65,7 @@ can help you understand how to work with Buildroot:
    there is no need for a full rebuild: a simple +make+ invocation
    will take the changes into account.
 
- * When a pacjage listed in +FOO_DEPENDENCIES+ is rebuilt or removed,
+ * When a package listed in +FOO_DEPENDENCIES+ is rebuilt or removed,
    the package +foo+ is not automatically rebuilt. For example, if a
    package +bar+ is listed in +FOO_DEPENDENCIES+ with +FOO_DEPENDENCIES
    = bar+ and the configuration of the +bar+ package is changed, the
