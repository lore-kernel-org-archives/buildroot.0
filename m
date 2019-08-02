From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 2 Aug 2019 17:22:48 +0200
Subject: [Buildroot] [PATCH 1/2] package/pkg-kconfig.mk: Reusability
 improvements
In-Reply-To: <20180921135521.32435-2-m.patzlaff@pilz.de>
References: <20180921135521.32435-1-m.patzlaff@pilz.de>
 <20180921135521.32435-2-m.patzlaff@pilz.de>
Message-ID: <20190802172248.61b5038d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 21 Sep 2018 15:55:20 +0200
Marcel Patzlaff <m.patzlaff@pilz.de> wrote:

> This patch refactors savedefconfig and the configuration re-generation
> to separate macros so that the functionality can be re-used in further
> rules.
> 
> Signed-off-by: Marcel Patzlaff <m.patzlaff@pilz.de>
> ---
>  package/pkg-kconfig.mk | 43 ++++++++++++++++++++++++------------------
>  1 file changed, 25 insertions(+), 18 deletions(-)

I've applied to master, which required fixing a few conflicts due to
other changes that occurred in the mean time. Sorry for the time it
took :-/

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
