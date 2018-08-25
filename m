From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Aug 2018 09:51:31 +0200
Subject: [Buildroot] [PATCH] sunxi-mali-mainline: add EULA license file
In-Reply-To: <f4eab7a8-6eff-889e-ff8f-636c83cfbe8a@micronovasrl.com>
References: <20180824234752.39453-1-giulio.benetti@micronovasrl.com>
 <f4eab7a8-6eff-889e-ff8f-636c83cfbe8a@micronovasrl.com>
Message-ID: <20180825095131.14ca9459@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Giulio,

On Sat, 25 Aug 2018 02:22:50 +0200, Giulio Benetti wrote:

> Even if it could be acceptable(maybe?), I would like to make the best.
> Did I have also in this case split into 2 different commits?
> One for package and one for hash file?
> Because thinking about bisection,
> even if I apply them one by one, it builds ok,
> except for warning if there is not hash file.
> So maybe I should do 2 patches in these order:
> - sunxi-mali-mainline: add EULA license file
> - sunxi-mali-mainline: add hash file

Do it the other way around:

 - Add the hash file, without the hash for the EULA file, just for the
   tarball.

 - Add the license file information + the hash of the license file.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
