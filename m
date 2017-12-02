From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Dec 2017 15:58:18 +0100
Subject: [Buildroot] [PATCH v5 03/11] board: Add Bananapi M64 support
In-Reply-To: <1509559553-26544-4-git-send-email-jagan@amarulasolutions.com>
References: <1509559553-26544-1-git-send-email-jagan@amarulasolutions.com>
 <1509559553-26544-4-git-send-email-jagan@amarulasolutions.com>
Message-ID: <20171202155818.0d04f798@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  1 Nov 2017 19:05:45 +0100, Jagan Teki wrote:

> +# Firmware
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/apritzel/arm-trusted-firmware.git"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50iw1p1"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="aa75c8da415158a94b82a430b2b40000778e851f"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="bl31"

What is this "bl31" additional variable doing?

Aren't you hijacking the ADDITIONAL_VARIABLES thing to call the bl31
make target ?

I understand it works, but it's a hack.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
