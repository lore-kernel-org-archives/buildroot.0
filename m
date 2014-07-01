From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Jul 2014 23:56:05 +0200
Subject: [Buildroot] [git commit] libyaml: add license information
Message-ID: <20140701224922.14FC39D12D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=195841dbbfbc15c69605aeba515b0933f6e868ba
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libyaml/libyaml.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libyaml/libyaml.mk b/package/libyaml/libyaml.mk
index 28ed77a..0a42742 100644
--- a/package/libyaml/libyaml.mk
+++ b/package/libyaml/libyaml.mk
@@ -8,5 +8,7 @@ LIBYAML_VERSION = 0.1.6
 LIBYAML_SOURCE = yaml-$(LIBYAML_VERSION).tar.gz
 LIBYAML_SITE = http://pyyaml.org/download/libyaml/
 LIBYAML_INSTALL_STAGING = YES
+LIBYAML_LICENSE = MIT
+LIBYAML_LICENSE_FILES = LICENSE
 
 $(eval $(autotools-package))
