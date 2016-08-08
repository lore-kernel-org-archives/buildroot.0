From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Aug 2016 23:47:31 +0200
Subject: [Buildroot] [PATCH] cairo: fix m68k uclinux compile
In-Reply-To: <20160808044617.GA9742@waldemar-brodkorb.de>
References: <20160808044617.GA9742@waldemar-brodkorb.de>
Message-ID: <20160808234731.6bb30f56@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 8 Aug 2016 06:46:17 +0200, Waldemar Brodkorb wrote:
> The GCC manual suggest when getting:
> relocation truncated to fit: R_68K_GOT16O foobar
> to use -mxgot.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/31a488316fe3c14729a6dd9259205f8530684cab/
>   http://autobuild.buildroot.net/results/dc6b899e3e502d65b2cf2f6d922a4f63857edf82/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/cairo/cairo.mk | 5 +++++
>  1 file changed, 5 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
