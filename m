From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Aug 2016 00:02:15 +0200
Subject: [Buildroot] [PATCH] libxml2: fix m68k uclinux compile
In-Reply-To: <20160810193748.GA13089@waldemar-brodkorb.de>
References: <20160810193748.GA13089@waldemar-brodkorb.de>
Message-ID: <20160811000215.0ec5a81d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 10 Aug 2016 21:37:48 +0200, Waldemar Brodkorb wrote:
> The GCC manual suggest when getting:
> relocation truncated to fit: R_68K_GOT16O foobar
> to use -mxgot.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/8a4e26bb1c0c64759e3914eced0a36baa0967f0b/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/libxml2/libxml2.mk | 5 +++++
>  1 file changed, 5 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
