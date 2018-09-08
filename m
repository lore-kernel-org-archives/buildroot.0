From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 9 Sep 2018 00:05:38 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/botan: needs boost
 libraries filesystem and system
In-Reply-To: <20180825063702.4593-1-bernd.kuhls@t-online.de>
References: <20180825063702.4593-1-bernd.kuhls@t-online.de>
Message-ID: <20180909000538.3d238f67@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 25 Aug 2018 08:37:02 +0200, Bernd Kuhls wrote:
> Without them the build fails:
> 
> /home/naourr/work/instance-0/output/host/lib/gcc/arm-buildroot-linux-mu
>  sleabihf/7.3.0/../../../../arm-buildroot-linux-musleabihf/bin/ld:
>   cannot find -lboost_filesystem
> /home/naourr/work/instance-0/output/host/lib/gcc/arm-buildroot-linux-mu
>  sleabihf/7.3.0/../../../../arm-buildroot-linux-musleabihf/bin/ld:
>   cannot find -lboost_system
> 
> Bug was introduced in next branch by commit
> https://git.buildroot.net/buildroot/commit/?h=next&id=031f5c04d9de5a21d3bc49f3849af3e6593fa1a8
> 
> Fixes
> http://autobuild.buildroot.net/results/cb9/cb90f4ed4d130a2ab6f6d085708a482a51d7dc91/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/botan/Config.in | 2 ++
>  1 file changed, 2 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
