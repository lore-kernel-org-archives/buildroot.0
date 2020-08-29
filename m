From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 29 Aug 2020 23:21:02 +0200
Subject: [Buildroot] [PATCH v3 12/13] package/udisks/udisks.mk:
 alphabatize dependencies
In-Reply-To: <20200725230618.3640682-13-aduskett@gmail.com>
References: <20200725230618.3640682-1-aduskett@gmail.com>
 <20200725230618.3640682-13-aduskett@gmail.com>
Message-ID: <20200829232102.3df78131@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 25 Jul 2020 16:06:17 -0700
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> This patch makes the upcoming udisk2 version bump patch easier to read,
> and also fixes the udisks.mk, so it follows Buildroot's package guidelines.
> 
> Host packages are placed on top of the dependency list, followed by target
> dependencies.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
>  package/udisks/udisks.mk | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
