From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Feb 2019 20:08:45 +0100
Subject: [Buildroot] [git commit branch/next] package/libyaml: add host
 variant
Message-ID: <20190213214530.CFCEA8A34D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e35fb626991527938078113b8bba07bd1fba9ba0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

host-libyaml is needed for host-python-pyyaml

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libyaml/libyaml.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libyaml/libyaml.mk b/package/libyaml/libyaml.mk
index 26e318736c..dc7368a168 100644
--- a/package/libyaml/libyaml.mk
+++ b/package/libyaml/libyaml.mk
@@ -12,3 +12,4 @@ LIBYAML_LICENSE = MIT
 LIBYAML_LICENSE_FILES = LICENSE
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
