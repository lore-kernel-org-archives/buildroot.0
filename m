From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Oct 2013 23:00:42 +0100
Subject: [Buildroot] [PATCH 1/2] arch/Config.in: introduce
 BR2_KERNEL_64_USERLAND_32 symbol
In-Reply-To: <1382706623-5593-1-git-send-email-gustavo@zacarias.com.ar>
References: <1382706623-5593-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20131030230042.19f3faae@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Fri, 25 Oct 2013 10:10:22 -0300, Gustavo Zacarias wrote:
> On some architectures one can be running a 64-bit kernel with a 32-bit
> userland.
> Such is the case for sparc64 (unsupported) for example and mips64 with
> n32 ABI.
> Some tools that interface directly with the kernel need to be built
> specially for this, so introduce this symbol to tweak their build in one
> central kludge to be future-proof.
> Example: bug #6602.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  arch/Config.in      | 3 +++
>  arch/Config.in.mips | 1 +
>  2 files changed, 4 insertions(+)

Applied both patches to for-peter-2013.11, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
