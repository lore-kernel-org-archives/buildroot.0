From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Dec 2018 22:47:53 +0100
Subject: [Buildroot] [PATCH/next 1/2] quagga: bump to version 1.2.3
In-Reply-To: <20181201204048.7791-1-fontaine.fabrice@gmail.com>
References: <20181201204048.7791-1-fontaine.fabrice@gmail.com>
Message-ID: <20181201224753.7112f805@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  1 Dec 2018 21:40:47 +0100, Fabrice Fontaine wrote:
> - Remove all patches except the first one as they are already in this
>   version
> - Remove AUTORECONF = YES as we're not patching any *.ac files anymore
> - Disable new nhrpd option
> - Add hash for license file
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...ure-fix-static-linking-with-readline.patch |  41 -------
>  ...y-fix-indirect-static-link-with-zlib.patch | 108 -----------------
>  ...PATH-size-calculation-for-long-paths.patch |  33 -----
>  ...valid-attr-length-sends-NOTIFY-with-.patch |  69 -----------
>  ...Fix-double-free-of-unknown-attribute.patch | 112 -----------------
>  ...bug-print-of-received-NOTIFY-data-ca.patch | 114 ------------------
>  ...x-infinite-loop-on-certain-invalid-O.patch |  43 -------
>  package/quagga/quagga.hash                    |   5 +-
>  package/quagga/quagga.mk                      |   8 +-
>  9 files changed, 7 insertions(+), 526 deletions(-)
>  delete mode 100644 package/quagga/0002-configure-fix-static-linking-with-readline.patch
>  delete mode 100644 package/quagga/0003-lib-memory-fix-indirect-static-link-with-zlib.patch
>  delete mode 100644 package/quagga/0004-bgpd-Fix-AS_PATH-size-calculation-for-long-paths.patch
>  delete mode 100644 package/quagga/0005-bgpd-security-invalid-attr-length-sends-NOTIFY-with-.patch
>  delete mode 100644 package/quagga/0006-bgpd-security-Fix-double-free-of-unknown-attribute.patch
>  delete mode 100644 package/quagga/0007-bgpd-security-debug-print-of-received-NOTIFY-data-ca.patch
>  delete mode 100644 package/quagga/0008-bgpd-security-fix-infinite-loop-on-certain-invalid-O.patch

Both applied to next. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
