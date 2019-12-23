From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Dec 2019 23:07:11 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/tftpd: add an
 upstream URL to Config.in
Message-ID: <20191223220036.1D9538E0CE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=04133634d1b066eafc9660a4d8cd5293ace82991
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

Add an upstream URL to the help text in Config.in. This
addresses the 'Missing' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
[yann.morin.1998 at free.fr:
  - use the git tree instead of the 8-year old freshmeat webpage
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 23ac8317a65ca74d931887415a793e36bbd243f4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tftpd/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/tftpd/Config.in b/package/tftpd/Config.in
index ea5cb303f9..d4e81e70bc 100644
--- a/package/tftpd/Config.in
+++ b/package/tftpd/Config.in
@@ -6,3 +6,5 @@ config BR2_PACKAGE_TFTPD
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	help
 	  HPA's Trivial File Transfer Protocol (tftp) server.
+
+	  https://git.kernel.org/pub/scm/network/tftp/tftp-hpa.git
