From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Jul 2017 21:48:02 +0200
Subject: [Buildroot] [PATCH 1/2] arch/mips: improve help text of NaN
 option
In-Reply-To: <20170717122255.61795-1-Vincent.Riera@imgtec.com>
References: <20170717122255.61795-1-Vincent.Riera@imgtec.com>
Message-ID: <20170719214802.327823a9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 17 Jul 2017 13:22:54 +0100, Vicente Olivert Riera wrote:
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  arch/Config.in.mips | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Both applied, thanks!

Have you had the chance to look at the -mnan issue with old gcc
versions ? This is currently making the autobuilders quite noisy, which
isn't nice.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
