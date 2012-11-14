From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 14 Nov 2012 22:38:05 +0100
Subject: [Buildroot] [git commit] tcpdump: add license info
Message-ID: <20121114214735.7FB6A99B26@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3b0afe6a9ce9b02b2e54509021388b7baee21e61
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/tcpdump/tcpdump.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/tcpdump/tcpdump.mk b/package/tcpdump/tcpdump.mk
index c232dc9..96414ef 100644
--- a/package/tcpdump/tcpdump.mk
+++ b/package/tcpdump/tcpdump.mk
@@ -8,6 +8,9 @@
 
 TCPDUMP_VERSION = 4.3.0
 TCPDUMP_SITE = http://www.tcpdump.org/release
+TCPDUMP_LICENSE = BSD-3c
+TCPDUMP_LICENSE_FILES = LICENSE
+
 TCPDUMP_CONF_ENV = ac_cv_linux_vers=2 td_cv_buggygetaddrinfo=no
 TCPDUMP_CONF_OPT = --without-crypto \
 		$(if $(BR2_PACKAGE_TCPDUMP_SMB),--enable-smb,--disable-smb)
