From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Oct 2019 18:57:57 +0200
Subject: [Buildroot] [PATCH 2/2] configs/friendlyarm_nanopi_neo_plus2:
 use an extlinux instead of uEnv.txt
In-Reply-To: <20191026164433.13471-2-aussedat.louis@gmail.com>
References: <20191026164433.13471-1-aussedat.louis@gmail.com>
 <20191026164433.13471-2-aussedat.louis@gmail.com>
Message-ID: <20191026185757.5a8dc9a1@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 26 Oct 2019 18:44:33 +0200
Louis Aussedat <aussedat.louis@gmail.com> wrote:

> @@ -3,7 +3,7 @@ image boot.vfat {
>  		files = {
>  			"Image",
>  			"sun50i-h5-nanopi-neo-plus2.dtb",
> -			"boot.scr"
> +			"extlinux"

Shouldn't this be extlinux.conf ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
