From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Oct 2014 21:52:48 +0100
Subject: [Buildroot] [PATCH] shairport-sync: needs toolchain with NPTL
In-Reply-To: <4f23aeb270143c08f76b81f8ff30c76ea8407a4b.1414589620.git.baruch@tkos.co.il>
References: <4f23aeb270143c08f76b81f8ff30c76ea8407a4b.1414589620.git.baruch@tkos.co.il>
Message-ID: <20141030215248.4afed119@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Wed, 29 Oct 2014 15:33:40 +0200, Baruch Siach wrote:
> Also remove the comment attributing threads dependency to alsa-lib, since
> shairport-sync itself uses pthreads.
> 
> Fixes:
> http://autobuild.buildroot.net/results/58e/58eafd2499919a45bfb5a2becc233d3678deedde/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/shairport-sync/Config.in | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied, thanks. And thanks to Arnout for the review.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
