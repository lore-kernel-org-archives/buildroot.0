From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Jul 2015 22:57:01 +0200
Subject: [Buildroot] [PATCH 3/3] package/mesa3d: Fix dri config option
In-Reply-To: <1438198976-25523-3-git-send-email-bernd.kuhls@t-online.de>
References: <1438198976-25523-1-git-send-email-bernd.kuhls@t-online.de>
 <1438198976-25523-3-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150729225701.4c2eae06@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Wed, 29 Jul 2015 21:42:56 +0200, Bernd Kuhls wrote:
> The option is constructed by AC_ARG_ENABLE and not AC_ARG_WITH:
> http://cgit.freedesktop.org/mesa/mesa/tree/configure.ac?h=10.6#n726
> 
> Fixes
> http://autobuild.buildroot.net/results/6e3/6e313e2a4b2ff092d187ac564f25c14aaaceb0dd/
> http://autobuild.buildroot.net/results/e3c/e3c3e441038b72c78c8e94370baa036ab1effb6b/
> http://autobuild.buildroot.net/results/11f/11f09260428a766d1f274843a9aebe220fd0e988/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/mesa3d/mesa3d.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
