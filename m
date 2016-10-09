From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Oct 2016 13:54:27 +0200
Subject: [Buildroot] [PATCH] uclibc: fix two more regressions introduced
 in 1.0.18
In-Reply-To: <20161008182245.GA20638@waldemar-brodkorb.de>
References: <20161008182245.GA20638@waldemar-brodkorb.de>
Message-ID: <20161009135427.4f0290bf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 8 Oct 2016 20:22:45 +0200, Waldemar Brodkorb wrote:
> Fixes:
>   http://autobuild.buildroot.net/results/e4c/e4c65ecf3ec011c39a80fd5d39ea0742c6171b06/
>   http://autobuild.buildroot.net/results/1c1/1c1080795c5f65c3e8a6b1bd79ca9dd997409260/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/uclibc/0003-cleanup-libc.a.patch           | 42 ++++++++++++++++++++++
>  ...include-copysgnl.c-if-UCLIBC_HAS_LONG_DOU.patch | 31 ++++++++++++++++
>  2 files changed, 73 insertions(+)
>  create mode 100644 package/uclibc/0003-cleanup-libc.a.patch
>  create mode 100644 package/uclibc/0004-ppc-do-not-include-copysgnl.c-if-UCLIBC_HAS_LONG_DOU.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
