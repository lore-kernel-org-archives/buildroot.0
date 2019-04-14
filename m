From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 14 Apr 2019 15:01:17 +0200
Subject: [Buildroot] [PATCH 1/2] package/mutt: fix static build with
 idn2 and unistring
In-Reply-To: <20190414084600.29278-1-fontaine.fabrice@gmail.com>
References: <20190414084600.29278-1-fontaine.fabrice@gmail.com>
Message-ID: <20190414150117.3e01d134@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 14 Apr 2019 10:45:59 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/c9544b4f1a0252e260a2ed19218fa950f4dc2d2d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...-static-build-with-idn2-and-unistrin.patch | 37 +++++++++++++++++++
>  package/mutt/mutt.mk                          |  2 +
>  2 files changed, 39 insertions(+)
>  create mode 100644 package/mutt/0001-configure.ac-fix-static-build-with-idn2-and-unistrin.patch

Both applied, thanks! As usual, using pkg-config would have been better :-)

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
