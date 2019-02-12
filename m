From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Feb 2019 20:13:15 +0100
Subject: [Buildroot] [git commit branch/next] package/python-typing: add
 host variant
Message-ID: <20190213214530.DF9988A34D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dbbba13e718957a6ac3cf95dd3242db4dbdb4ce8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

host-python-typing is needed for mongodb 4.0.6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-typing/python-typing.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-typing/python-typing.mk b/package/python-typing/python-typing.mk
index acb5316129..663227dfc9 100644
--- a/package/python-typing/python-typing.mk
+++ b/package/python-typing/python-typing.mk
@@ -12,3 +12,4 @@ PYTHON_TYPING_LICENSE = Python-2.0, others
 PYTHON_TYPING_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
+$(eval $(host-python-package))
