From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 8 Jul 2010 23:06:53 +0200
Subject: [Buildroot] [git commit master 1/1] Fix a wrong sentence in the
	docs.
Message-ID: <20100708210709.0993682794@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=a8102672d990f5ac6cf0fb689cb0073712e08f0c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/buildroot.html |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/docs/buildroot.html b/docs/buildroot.html
index 48854de..6d4f17c 100644
--- a/docs/buildroot.html
+++ b/docs/buildroot.html
@@ -1010,7 +1010,7 @@ $(eval $(call GENTARGETS,package,libfoo,host))
 
    <p>For the target package, the <code>GENTARGETS</code> uses the
    variables defined by the .mk file and prefixed by the uppercased
-   package name: <code>LIBFOO_*</code>. For target package, it uses
+   package name: <code>LIBFOO_*</code>. For the host package, it uses
    the <code>HOST_LIBFOO_*</code>. For <i>some</i> variables, if the
    <code>HOST_LIBFOO_</code> prefixed variable doesn't exist, the
    package infrastructure uses the corresponding variable prefixed by
-- 
1.7.1
