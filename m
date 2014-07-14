From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Jul 2014 13:12:03 +0200
Subject: [Buildroot] [PATCH] nasm: remove unused target package
In-Reply-To: <1405320062-21455-1-git-send-email-arnout@mind.be>
References: <1405320062-21455-1-git-send-email-arnout@mind.be>
Message-ID: <20140714131203.28663a38@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle (Essensium/Mind),

On Mon, 14 Jul 2014 08:41:02 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> When nasm was added in da8d09b716, it got both the host and the target
> variants even though it doesn't have a Config.in and the target variant isn't
> used anywhere. Therefore, this patch removes the unused target variant.
> 
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  package/nasm/nasm.mk | 1 -
>  1 file changed, 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
