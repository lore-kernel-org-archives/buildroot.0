From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 Aug 2016 16:46:38 +0200
Subject: [Buildroot] [PATCH 1/2] package/trousers: needs host-pkgconf
In-Reply-To: <1471815409-25953-1-git-send-email-romain.naour@gmail.com>
References: <1471815409-25953-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160822164638.19e8ce13@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 21 Aug 2016 23:36:48 +0200, Romain Naour wrote:
> Otherwise the build fail with this error:
> configure.in:53: error: possibly undefined macro: AC_MSG_ERROR
>       If this token and others are legitimate, please use m4_pattern_allow.
>       See the Autoconf documentation.
> configure.in:95: error: possibly undefined macro: AM_CONDITIONAL
> 
> Also, there is a PKG_CHECK_MODULES used for GTK.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/trousers/trousers.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Both applied to master, thanks! Please don't forget to send the
<limits.h> build fix upstream!

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
