From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Aug 2016 23:47:35 +0200
Subject: [Buildroot] [PATCH] gnuplot: fix m68k uclinux compile
In-Reply-To: <20160808044703.GA11895@waldemar-brodkorb.de>
References: <20160808044703.GA11895@waldemar-brodkorb.de>
Message-ID: <20160808234735.58e6fbc8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 8 Aug 2016 06:47:04 +0200, Waldemar Brodkorb wrote:
> The GCC manual suggest when getting:
> relocation truncated to fit: R_68K_GOT16O foobar
> to use -mxgot.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/d1e030c42f43f49575f36ecc82e9dd9018ca4f73/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/gnuplot/gnuplot.mk | 5 +++++
>  1 file changed, 5 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
