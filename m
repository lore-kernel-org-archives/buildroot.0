From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 Aug 2016 22:47:30 +0200
Subject: [Buildroot] [PATCH] libdvdnav: fix nios2 cross-compile
In-Reply-To: <20160731101716.GA3788@waldemar-brodkorb.de>
References: <20160731101716.GA3788@waldemar-brodkorb.de>
Message-ID: <20160804224730.5b009f5c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 31 Jul 2016 12:17:16 +0200, Waldemar Brodkorb wrote:
> The host is misdetected as OS/2.
> 
> Fixes:
> http://autobuild.buildroot.net/results/d5b30d6b5463928ded1a1c1f1f5345a726f6ffaf/
> http://autobuild.buildroot.net/results/917041c7165093f44a5d3b4a5ba56a3d1b59e456/
> http://autobuild.buildroot.net/results/dcfc53b6fc25210cf70a1abf0e24b85f0d971101/
> http://autobuild.buildroot.net/results/79109d06183efa17f6f68c1ea78cbd9927c5c46e/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
> I am not sure where to report this upstream. Any hints?
> ---
>  package/libdvdnav/0001-do-not-match-nios2-as-os2.patch | 16 ++++++++++++++++
>  package/libdvdnav/libdvdnav.mk                         |  2 ++
>  2 files changed, 18 insertions(+)
>  create mode 100644 package/libdvdnav/0001-do-not-match-nios2-as-os2.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
