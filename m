From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 2 May 2017 22:35:24 +0200
Subject: [Buildroot] [PATCH] python-netaddr: change setup type to
 setuptools
In-Reply-To: <20170502121459.18710-1-yegorslists@googlemail.com>
References: <20170502121459.18710-1-yegorslists@googlemail.com>
Message-ID: <20170502223524.4aa3540e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  2 May 2017 14:14:59 +0200, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> The latest netaddr version switched to setuptools.
> 
> Fixes:
> 
> http://autobuild.buildroot.net/results/e9b/e9b0013abe7e866fd224593f90ec30bdc809151f
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/python-netaddr/python-netaddr.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
