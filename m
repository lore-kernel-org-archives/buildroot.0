From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Jan 2014 20:43:42 +0100
Subject: [Buildroot] [PATCH v2] Disable MIPS64 ISAs for MIPS32 targets
In-Reply-To: <1388759779-27871-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1388759779-27871-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20140103204342.57052738@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Fri, 3 Jan 2014 14:36:19 +0000, Vicente Olivert Riera wrote:
> Currently you can select MIPS64 ISAs, like mips64 and mips64r2, for
> MIPS32 targets. This is incorrect, so we disable the possibility to do
> that.
> 
> Reviewed-by: Markos Chandras <markos.chandras@imgtec.com>
> Signed-off-by: Vicente Olivert Riera <vincent.riera@imgtec.com>
> ---
>  arch/Config.in.mips |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
