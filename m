From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 May 2017 15:13:44 +0200
Subject: [Buildroot] [for-next 2/3] package/gcc: switch to gcc 6.x as
 the default
In-Reply-To: <20170525183457.12169-2-romain.naour@gmail.com>
References: <20170525183457.12169-1-romain.naour@gmail.com>
 <20170525183457.12169-2-romain.naour@gmail.com>
Message-ID: <20170526151344.2db79ce8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 25 May 2017 20:34:56 +0200, Romain Naour wrote:
> Even if gcc 5 is still maintained for some time (gcc 5.5 is pending),
> switch to gcc 6.x since it has been released since 2016-04-27 and
> gcc 7.x is available since 2017-05-02.
> 
> We have been having toolchains in the autobuilders with gcc
> 6.x for a while, so the vast majority of the problems should have
> already been solved.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/gcc/Config.in.host | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
