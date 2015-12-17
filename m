From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Dec 2015 11:54:16 +0100
Subject: [Buildroot] [PATCH] pkg-generic: remove unused NAMEVER
In-Reply-To: <1450310267-14329-1-git-send-email-arnout@mind.be>
References: <1450310267-14329-1-git-send-email-arnout@mind.be>
Message-ID: <20151217115416.49152e6b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle (Essensium/Mind),

On Thu, 17 Dec 2015 00:57:47 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:
> Commit 5538e476 (from 2013!) removed the use of the NAMEVER variable in
> .stamp_patched, but it was still defined. So remove the definition now.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  package/pkg-generic.mk | 1 -
>  1 file changed, 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
