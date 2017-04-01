From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Apr 2017 13:54:24 +0200
Subject: [Buildroot] [PATCH] package/systemd: fix build on not-recent
 distros
In-Reply-To: <20170331213354.14786-1-yann.morin.1998@free.fr>
References: <20170331213354.14786-1-yann.morin.1998@free.fr>
Message-ID: <20170401135424.15573d09@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 31 Mar 2017 23:33:54 +0200, Yann E. MORIN wrote:
> systemd is at it again, using ln --relative once more, which is not
> available but on the most recent distros.
> 
> Patch it out with a bit of sed magic.
> 
> Fixes:
>     http://autobuild.buildroot.org/results/48e/48ecf31eca9b22339a770abd3f9abdf1ae41cfd3/
>     http://autobuild.buildroot.org/results/c62/c6297c61d8c2d3ab9be77b9d398598adacdb33b3/
>     http://autobuild.buildroot.org/results/22f/22ff106a4626c84422d9a3e69aa9c8fe7c76938c/
>     ...
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> 
> ---
> Note-1: that patch could be generalised to the other ln --relative
> patch we carry, but this should be done in an upstreamable solution,
> which I doubt is possible, but I'll try.

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
