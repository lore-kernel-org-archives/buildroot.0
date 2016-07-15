From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Jul 2016 20:36:23 +0200
Subject: [Buildroot] [PATCH 04/12 v8] package/eudev: fix configure
 options
In-Reply-To: <68e73e2f3ac706797f43901c923cf59f5e9e7640.1468274498.git.yann.morin.1998@free.fr>
References: <cover.1468274498.git.yann.morin.1998@free.fr>
 <68e73e2f3ac706797f43901c923cf59f5e9e7640.1468274498.git.yann.morin.1998@free.fr>
Message-ID: <20160715203623.7c4ca428@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 12 Jul 2016 00:16:27 +0200, Yann E. MORIN wrote:
> --enable-libkmod does not exist, but there's --enable-kmod.
> 
> Also, add --enable-blkid to the list of options, since we already depend
> on it (from util-linux).
> 
> Also do not align \ for line continuations.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/eudev/eudev.mk | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
