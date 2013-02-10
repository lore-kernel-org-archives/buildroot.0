From: Floris Bos <bos@je-eigen-domein.nl>
Date: Sun, 10 Feb 2013 14:24:29 +0100
Subject: [Buildroot] [PATCH] package/rpi-userland: update to fix
 no-longer applying patch
In-Reply-To: <1360497506-31282-1-git-send-email-yann.morin.1998@free.fr>
References: <1360497506-31282-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <51179F8D.6050800@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/10/2013 12:58 PM, Yann E. MORIN wrote:
> Our patches do not apply as-is against the version of rpi-userland we
> package (weird...).

RPI_USERLAND_SITE = http://github.com/raspberrypi/userland/tarball/master

Shouldn't that be something like this?

RPI_USERLAND_SITE = 
http://github.com/raspberrypi/userland/tarball/$(RPI_USERLAND_VERSION)


Yours sincerely,

Floris Bos
