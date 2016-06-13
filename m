From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Jun 2016 11:56:29 +0200
Subject: [Buildroot] [PATCH] gmp: disable ASM for m68k coldfire
In-Reply-To: <20160613060405.GA7971@waldemar-brodkorb.de>
References: <20160613060405.GA7971@waldemar-brodkorb.de>
Message-ID: <20160613115629.2f6b967f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 13 Jun 2016 08:04:05 +0200, Waldemar Brodkorb wrote:
> Some m68k assembly is used inside gmp, so disable it for
> coldfire.
> 
> Fixes following autobuild error:
> http://autobuild.buildroot.net/results/30ac7b7fdaa51c0fe4fcafbbb558d60cb3d9fe51/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/gmp/gmp.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
