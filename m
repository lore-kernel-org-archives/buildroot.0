From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Feb 2018 23:00:21 +0100
Subject: [Buildroot] [PATCH] m68k: add the real gcc bugfix from upstream
In-Reply-To: <20180218182151.GA5995@waldemar-brodkorb.de>
References: <20180218182151.GA5995@waldemar-brodkorb.de>
Message-ID: <20180225230021.677294f1@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 18 Feb 2018 19:21:52 +0100, Waldemar Brodkorb wrote:
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/gcc/4.9.4/0002-m68k-coldfire-pr68467.patch | 48 ++++++++++++++++++++++
>  package/gcc/4.9.4/891-fix-m68k-uclinux.patch       | 18 --------
>  package/gcc/5.5.0/0001-m68k-coldfire-pr68467.patch | 48 ++++++++++++++++++++++
>  package/gcc/5.5.0/891-fix-m68k-uclinux.patch       | 18 --------
>  package/gcc/6.4.0/0001-m68k-coldfire-pr68467.patch | 48 ++++++++++++++++++++++
>  package/gcc/6.4.0/891-fix-m68k-uclinux.patch       | 18 --------
>  package/gcc/7.3.0/0001-m68k-coldfire-pr68467.patch | 48 ++++++++++++++++++++++
>  package/gcc/7.3.0/0891-fix-m68k-uclinux.patch      | 30 --------------
>  8 files changed, 192 insertions(+), 84 deletions(-)
>  create mode 100644 package/gcc/4.9.4/0002-m68k-coldfire-pr68467.patch
>  delete mode 100644 package/gcc/4.9.4/891-fix-m68k-uclinux.patch
>  create mode 100644 package/gcc/5.5.0/0001-m68k-coldfire-pr68467.patch
>  delete mode 100644 package/gcc/5.5.0/891-fix-m68k-uclinux.patch
>  create mode 100644 package/gcc/6.4.0/0001-m68k-coldfire-pr68467.patch
>  delete mode 100644 package/gcc/6.4.0/891-fix-m68k-uclinux.patch
>  create mode 100644 package/gcc/7.3.0/0001-m68k-coldfire-pr68467.patch
>  delete mode 100644 package/gcc/7.3.0/0891-fix-m68k-uclinux.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
