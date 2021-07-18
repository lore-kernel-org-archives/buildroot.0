From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 18 Jul 2021 23:40:14 +0200
Subject: [Buildroot] [PATCH 1/1] package/{bluez5_utils,
 bluez5_utils-headers}: bump to version 5.60
In-Reply-To: <20210711070521.242040-1-bernd.kuhls@t-online.de>
References: <20210711070521.242040-1-bernd.kuhls@t-online.de>
Message-ID: <20210718234014.7fa34a04@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, 11 Jul 2021 09:05:21 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Release notes:
> http://www.bluez.org/release-of-bluez-5-59/
> http://www.bluez.org/release-of-bluez-5-60/
> 
> Added configure option to disable manpages to avoid rst2man dependency
> introduced by version 5.59.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> depends on ell 0.41:
> http://patchwork.ozlabs.org/project/buildroot/patch/20210621052631.134719-1-bernd.kuhls at t-online.de/

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
