From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Jun 2018 14:04:58 +0200
Subject: [Buildroot] [PATCH 1/1] network-manager: Fix package prompt name
In-Reply-To: <20180615212125.22335-1-petr.vorel@gmail.com>
References: <20180615212125.22335-1-petr.vorel@gmail.com>
Message-ID: <20180617140458.68dae8ec@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 15 Jun 2018 23:21:25 +0200, Petr Vorel wrote:
> Rename the prompt string for consistency with the package directory
> name.
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
>  package/network-manager/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
