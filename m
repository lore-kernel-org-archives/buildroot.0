From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Oct 2016 13:10:24 +0200
Subject: [Buildroot] [PATCH v4 1/3] vexpress-firmware: new package
In-Reply-To: <1476518623-30654-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1476518623-30654-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1476518623-30654-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20161015131024.76916be0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 15 Oct 2016 10:03:41 +0200, Thomas Petazzoni wrote:

> +VEXPRESS_FIRMWARE_VERSION = 901f81977c3b367a2e0bf3d6444be302822d97a3
> +VEXPRESS_FIRMWARE_SITE = https://git.linaro.org/arm/vexpress-firmware.git

Joao, this is an old version of the firmware. Can you test with a newer
version?

Indeed, this old version in fact doesn't have any license file in the
tree. Newer versions have license.pdf and license.rtf files.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
