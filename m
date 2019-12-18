From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 18 Dec 2019 22:06:01 +0100
Subject: [Buildroot] [git commit] package/tftpd: add an upstream URL to
 Config.in
Message-ID: <20191218205810.AC0F98C5F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=23ac8317a65ca74d931887415a793e36bbd243f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add an upstream URL to the help text in Config.in. This
addresses the 'Missing' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
[yann.morin.1998 at free.fr:
  - use the git tree instead of the 8-year old freshmeat webpage
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
