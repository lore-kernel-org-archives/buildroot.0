From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Sep 2018 20:44:03 +0200
Subject: [Buildroot] [PATCH v2] bluez-alsa: correct LICENSE.txt hash
In-Reply-To: <20180913125653.31730-1-giulio.benetti@micronovasrl.com>
References: <5d8fb888-294e-5fc7-83ac-11a5fa66e2e2@micronovasrl.com>
 <20180913125653.31730-1-giulio.benetti@micronovasrl.com>
Message-ID: <20180913204403.2d7c8c62@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 13 Sep 2018 14:56:53 +0200, Giulio Benetti wrote:
> After bumping from v1.3.0 to v1.3.1 hash has not been recalculated.
> 
> Changes in LICENSE.txt:
> 2018 J?rg Krause has been added to LICENSE.txt
> 
> Recalculate correct LICENSE.txt hash and add it to bluez-alsa.hash file.
> 
> Fixes:
> http://autobuild.buildroot.net/results/40c/40c35c1c3470a5ece7e9f82525efaceabfaaf841/
> http://autobuild.buildroot.net/results/a0b/a0bcd9c7a308cd09e8cfb7632970b52989d7bff7/
> http://autobuild.buildroot.net/results/7de/7deb42c0b8325d211805a3211b5b475edc60ec57/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
> Changes V1->V2:
> * remove tarball's hash change, it was still using bluez-alsa-v1.3.0.tar.gz
>   instead of bluez-alsa-v1.3.1.tar.gz

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
