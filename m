From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Nov 2016 23:17:40 +0100
Subject: [Buildroot] [PATCH] gcc: the special workaround for ARC is no
 longer required
In-Reply-To: <20161123112016.GA29549@waldemar-brodkorb.de>
References: <20161123112016.GA29549@waldemar-brodkorb.de>
Message-ID: <20161123231740.5a89afe6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 23 Nov 2016 12:20:16 +0100, Waldemar Brodkorb wrote:
> It seems with the change to gcc 6.x based toolchain this
> workaround is no longer required. Tested with an arc hs toolchain.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/gcc/gcc-initial/gcc-initial.mk | 13 -------------
>  1 file changed, 13 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
