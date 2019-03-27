From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Mar 2019 10:46:20 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] cups: disable pam support
Message-ID: <20190327094316.D12C881486@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=177dba6c1bd83c894e4f21e0868966043d471f94
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Make the build consistent.

Cc: Olivier Schonken <olivier.schonken@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Acked-by: Olivier Schonken <olivier.schonken@gmail.com>
Signed-off-by: Baruch Siach &lt;<a href="mailto:baruch@tkos.co.il" target="_blank" rel="noreferrer">baruch at tkos.co.il</a>&gt;<br>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d3221806b94bd7f26d70a1e82c2b01d311202c61)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cups/cups.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index 54271d5fc7..8f33824879 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -24,6 +24,7 @@ CUPS_CONF_OPTS = \
 	--without-java \
 	--without-php \
 	--disable-gssapi \
+	--disable-pam \
 	--libdir=/usr/lib
 CUPS_CONFIG_SCRIPTS = cups-config
 CUPS_DEPENDENCIES = \
