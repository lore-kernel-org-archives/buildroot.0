From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Oct 2015 23:45:19 +0200
Subject: [Buildroot] [PATCH] sparc64: fix toolchain building when C++ is
 enabled
In-Reply-To: <20151011171727.GA14946@waldemar-brodkorb.de>
References: <20151011171727.GA14946@waldemar-brodkorb.de>
Message-ID: <20151012234519.681f68b4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Waldemar Brodkorb,

On Sun, 11 Oct 2015 19:17:27 +0200, Waldemar Brodkorb wrote:
> Disable libsanitizer for sparc64, too. Same problem as for
> sparc, see https://bugs.busybox.net/show_bug.cgi?id=7951
> 
> Reported-By: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/gcc/gcc.mk |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
