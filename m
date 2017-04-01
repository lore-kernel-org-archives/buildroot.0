From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Apr 2017 13:58:11 +0200
Subject: [Buildroot] [PATCH] package/xenomai: remove sh4 support
In-Reply-To: <20170331203911.21186-1-romain.naour@gmail.com>
References: <20170331203911.21186-1-romain.naour@gmail.com>
Message-ID: <20170401135811.084982ba@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 31 Mar 2017 22:39:11 +0200, Romain Naour wrote:
> sh4 target support has been removed since Xenomai 3.x.
> 
> Fixes:
> http://autobuild.buildroot.net/results/a81/a8125847367de5fd27156e5cba9ec7315c2ccd5d/build-end.log
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/xenomai/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
