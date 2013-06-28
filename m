From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 28 Jun 2013 21:47:14 +0200
Subject: [Buildroot] [git commit] ortp: define license
Message-ID: <20130628195146.7EC649B292@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=75cfdb1fd7db85f96dae9886c92ab60d30bf3f66
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ortp/ortp.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/ortp/ortp.mk b/package/ortp/ortp.mk
index 8983df7..5ccc5ff 100644
--- a/package/ortp/ortp.mk
+++ b/package/ortp/ortp.mk
@@ -8,5 +8,7 @@ ORTP_VERSION = 0.20.0
 ORTP_SITE = http://download.savannah.nongnu.org/releases/linphone/ortp/sources
 ORTP_CONF_OPT = --disable-strict
 ORTP_INSTALL_STAGING = YES
+ORTP_LICENSE = LGPLv2.1+
+ORTP_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
