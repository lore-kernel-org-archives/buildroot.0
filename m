From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Sep 2017 22:50:20 +0200
Subject: [Buildroot] [PATCH] configs/ts4900: bump kernel version to 4.12
In-Reply-To: <1504211371-457-1-git-send-email-mathieu.audat@savoirfairelinux.com>
References: <1504211371-457-1-git-send-email-mathieu.audat@savoirfairelinux.com>
Message-ID: <20170902225020.276bbbf5@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 31 Aug 2017 16:29:31 -0400, Mathieu Audat wrote:
> ts4900 defconfig is upstream in Linux since v4.9:
>        a2f1145 ARM: dts: TS-4900: add basic device tree
> 
> Bump kernel version to v4.12 and use the upstreamed defconfig
> imx_v6_v7.
> 
> Signed-off-by: Mathieu Audat <mathieu.audat@savoirfairelinux.com>
> ---
>  configs/ts4900_defconfig | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)

Nice to see that the support is now upstream, great work!

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
