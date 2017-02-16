From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Feb 2017 22:37:57 +0100
Subject: [Buildroot] [PATCH] package/mpd: use proper
 BR2_PACKAGE_MPD_VERSION_0_19 symbol
In-Reply-To: <20170216082629.2296-1-joerg.krause@embedded.rocks>
References: <20170216082629.2296-1-joerg.krause@embedded.rocks>
Message-ID: <20170216223757.2aed6456@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 16 Feb 2017 09:26:29 +0100, J?rg Krause wrote:
> Commit 9244ad854 [1] adds a hidden choice between version 0.19 and 0.20. The
> Makefile now uses a wrong symbol introduced by this commit. Fix by:
> s/BR2_MPD_VERSION_0_19/BR2_PACKAGE_MPD_VERSION_0_19.
> 
> [1] https://git.buildroot.net/buildroot/commit/?id=9244ad854d30e8c942460646ef6f6194ee44942d
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
> Note, that this patch is targeted for the master branch.
> ---
>  package/mpd/mpd.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
