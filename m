From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Jun 2017 23:00:29 +0200
Subject: [Buildroot] [PATCH 1/1] package/iprutils: needs zlib
In-Reply-To: <20170610140106.28730-1-bernd.kuhls@t-online.de>
References: <20170610140106.28730-1-bernd.kuhls@t-online.de>
Message-ID: <20170610230029.1af22c8c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 10 Jun 2017 16:01:06 +0200, Bernd Kuhls wrote:
> Dependency was introduced by
> https://sourceforge.net/p/iprdd/iprutils/ci/1f24b814e56939fd09a2319323e604594784fef3/
> 
> Fixes
> http://autobuild.buildroot.net/results/48e/48e1c7fb920cbc81eee1cf2f43d1551a0a9ce31e/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/iprutils/Config.in   | 1 +
>  package/iprutils/iprutils.mk | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
