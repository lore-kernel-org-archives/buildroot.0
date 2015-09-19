From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Sep 2015 14:00:28 +0200
Subject: [Buildroot] [PATCH] micropython: Set MICROPY_GCREGS_SETJMP=1
 for xtensa and sh
In-Reply-To: <1442567975-11176-1-git-send-email-judge.packham@gmail.com>
References: <CAFOYHZCxy2PWfdPXiTrxDzf4LnLnPCwATyia200X2kHucNqJSA@mail.gmail.com>
 <1442567975-11176-1-git-send-email-judge.packham@gmail.com>
Message-ID: <20150919140028.3431f09b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Chris Packham,

On Fri, 18 Sep 2015 21:19:35 +1200, Chris Packham wrote:
> These architectures don't have explicit exception handling support in
> micropython but can use the setjmp fallback behaviour instead.
> 
> Signed-off-by: Chris Packham <judge.packham@gmail.com>
> ---
>  package/micropython/micropython.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
