From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 9 Dec 2018 14:35:25 +0100
Subject: [Buildroot] [PATCH] configs/nexbox_a95x: kernel needs
 host-openssl
In-Reply-To: <20181209094146.26427-1-yann.morin.1998@free.fr>
References: <20181209094146.26427-1-yann.morin.1998@free.fr>
Message-ID: <20181209143525.53fc6c6c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  9 Dec 2018 10:41:46 +0100, Yann E. MORIN wrote:
> Fixes: https://gitlab.com/ymorin/buildroot/-/jobs/131924236
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Peter Korsgaard <peter@korsgaard.com>

This defconfig didn't fail here:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/131217002

I'm curious to know you have different results. Both builds are using
the exact same Docker image, so it's a bit confusing what is going on
here.

Any idea ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
