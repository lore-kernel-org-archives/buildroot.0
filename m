From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Jun 2014 09:46:56 +0200
Subject: [Buildroot] [git commit] proxychains-ng: add license information
Message-ID: <20140626115218.7C6229D0AC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=93a9759d9179b2df0fae35b8d3cf0972e54e3953
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: strip whitespace]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/proxychains-ng/proxychains-ng.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/proxychains-ng/proxychains-ng.mk b/package/proxychains-ng/proxychains-ng.mk
index 7c2ffbf..ca2664e 100644
--- a/package/proxychains-ng/proxychains-ng.mk
+++ b/package/proxychains-ng/proxychains-ng.mk
@@ -7,6 +7,8 @@
 PROXYCHAINS_NG_VERSION = 4.6
 PROXYCHAINS_NG_SOURCE = proxychains-$(PROXYCHAINS_NG_VERSION).tar.bz2
 PROXYCHAINS_NG_SITE = http://downloads.sourceforge.net/project/proxychains-ng
+PROXYCHAINS_NG_LICENSE = GPLv2+
+PROXYCHAINS_NG_LICENSE_FILES = COPYING
 
 define PROXYCHAINS_NG_CONFIGURE_CMDS
 	cd $(@D) && \
