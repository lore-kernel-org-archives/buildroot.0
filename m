From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 May 2017 15:39:52 +0200
Subject: [Buildroot] [git commit] package/c-icap: remove configure option
	process-mutexes
Message-ID: <20170601202854.54E4E807D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=06afaf5b067a374fa9e91562d4d8a7ccd8c23ad5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This option was removed in 2014:
https://sourceforge.net/p/c-icap/code/1102/#diff-3

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/c-icap/c-icap.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/c-icap/c-icap.mk b/package/c-icap/c-icap.mk
index e32e0dc..82b2574 100644
--- a/package/c-icap/c-icap.mk
+++ b/package/c-icap/c-icap.mk
@@ -12,7 +12,6 @@ C_ICAP_LICENSE_FILES = COPYING
 C_ICAP_INSTALL_STAGING = YES
 C_ICAP_CONFIG_SCRIPTS = c-icap-config c-icap-libicapapi-config
 C_ICAP_CONF_OPTS = \
-	--with-process-mutexes=posix \
 	--without-perl \
 	--enable-large-files \
 	--enable-ipv6
