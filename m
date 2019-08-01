From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 1 Aug 2019 11:46:55 +0200
Subject: [Buildroot] [PATCH] package/efl: eina: set EINA_VALUE_EMPTY
 during library init
In-Reply-To: <20190718213620.10591-1-romain.naour@gmail.com>
References: <20190718213620.10591-1-romain.naour@gmail.com>
Message-ID: <20190801114655.33f44d57@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 18 Jul 2019 23:36:20 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> Fix a build issue introduced with efl 1.22.2.
> 
> See https://phab.enlightenment.org/D9348.
> 
> Fixes:
> http://autobuild.buildroot.net/results/fa8/fa80b558d2df9e02e2997d57ac0e3be63881c5c4
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  ...EINA_VALUE_EMPTY-during-library-init.patch | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 package/efl/0002-eina-set-EINA_VALUE_EMPTY-during-library-init.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
