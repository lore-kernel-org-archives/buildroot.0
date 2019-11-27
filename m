From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 27 Nov 2019 21:49:27 +0100
Subject: [Buildroot] [PATCH] system: allow not setting a default,
 system-wide time zone
In-Reply-To: <20191116091004.23726-1-yann.morin.1998@free.fr>
References: <20191116091004.23726-1-yann.morin.1998@free.fr>
Message-ID: <20191127214927.6480279f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 16 Nov 2019 10:10:04 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> It is valid that there is no system-wide default time zone defined, in
> which case Etc/UTC is assumed.
> 
> Fixes: #12316
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Martin Bark <martin@barkynet.com>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Richard Braun <rbraun@sceen.net>
> Cc: Andrew Trapani <andrew.trapani@ontera.bio>
> ---
>  package/tz/tz.mk         | 17 +++++++++++------
>  package/tzdata/tzdata.mk | 19 ++++++++++++-------
>  system/Config.in         |  2 ++
>  3 files changed, 25 insertions(+), 13 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
