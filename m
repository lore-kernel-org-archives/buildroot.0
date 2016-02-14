From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Feb 2016 21:50:42 +0100
Subject: [Buildroot] [PATCH 1/3] libraw: add dependency on host-pkgconf
In-Reply-To: <1455268773-12503-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1455268773-12503-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160214215042.406b51f7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 12 Feb 2016 10:19:31 +0100, Thomas Petazzoni wrote:
> Otherwise, it fails to autoreconf with a weird error message:
> 
> configure.ac:15: error: possibly undefined macro: AC_SUBST
>       If this token and others are legitimate, please use m4_pattern_allow.
>       See the Autoconf documentation.
> configure.ac:40: error: possibly undefined macro: AC_MSG_WARN
> 
> Indeed, the configure.ac uses PKG_CHECK_MODULES(), so we need to have
> the corresponding m4 file installed by host-pkgconf.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/libraw/libraw.mk | 1 +
>  1 file changed, 1 insertion(+)

All three patches applied on master!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
