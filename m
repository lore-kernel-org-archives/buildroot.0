From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Jul 2020 23:13:58 +0200
Subject: [Buildroot] [PATCH v2] configs/bananapi_m2_zero: new defconfig
In-Reply-To: <20200507164520.8299-1-vincent.stehle@laposte.net>
References: <20200413171831.12079-1-vincent.stehle@laposte.net>
 <20200507164520.8299-1-vincent.stehle@laposte.net>
Message-ID: <20200725231358.7681d015@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  7 May 2020 18:45:19 +0200
Vincent Stehl? <vincent.stehle@laposte.net> wrote:

> The Banana Pi M2 Zero [1] is a board from Sinovoip, based on the Allwinner
> H2+ SoC.
> 
> It is similar to the other Banana Pi M2* boards, from which this
> configuration is inspired.
> 
> [1]: http://www.banana-pi.org/m2z.html
> 
> Signed-off-by: Vincent Stehl? <vincent.stehle@laposte.net>

Thanks, I've applied.

> +# U-boot needs python3
> +BR2_PACKAGE_HOST_PYTHON3=y

We now have a better way of doing this, so I used the new way, i.e:

BR2_TARGET_UBOOT_NEEDS_PYTHON3=y

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
