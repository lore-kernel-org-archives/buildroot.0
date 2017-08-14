From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Aug 2017 22:10:41 +0200
Subject: [Buildroot] [PATCH] socrates_cyclone5_defconfig: U-Boot needs
 DTC
In-Reply-To: <20170813232524.17775-1-arnout@mind.be>
References: <20170813232524.17775-1-arnout@mind.be>
Message-ID: <20170814221041.1e398f77@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 14 Aug 2017 01:25:24 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> Probably not noticed before because dtc was already built or it was
> installed on the host.
> 
> Fixes: https://gitlab.com/arnout/buildroot/-/jobs/28979369
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Micha? ?yszczek <michal.lyszczek@bofc.pl>
> ---
>  configs/socrates_cyclone5_defconfig | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
