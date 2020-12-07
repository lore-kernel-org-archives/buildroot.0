From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 Dec 2020 22:56:20 +0100
Subject: [Buildroot] [PATCH 1/3] package/flare-engine: require
 sdl2_image with png support
In-Reply-To: <20201206135607.667917-1-romain.naour@gmail.com>
References: <20201206135607.667917-1-romain.naour@gmail.com>
Message-ID: <20201207225620.5e36a4b4@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  6 Dec 2020 14:56:05 +0100
Romain Naour <romain.naour@gmail.com> wrote:

> flare-engine fail to start if sdl2_image library is build without
> libpng support.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/flare-engine/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Thanks, series applied!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
