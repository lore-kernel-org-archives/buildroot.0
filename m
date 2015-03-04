From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Mar 2015 23:05:37 +0100
Subject: [Buildroot] [git commit] rpi-firmware: remove no longer used
 BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS
In-Reply-To: <54F78019.7020603@mind.be>
References: <20150304202748.6C184817F9@busybox.osuosl.org>
 <54F78019.7020603@mind.be>
Message-ID: <20150304230537.78290b41@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Wed, 04 Mar 2015 22:58:49 +0100, Arnout Vandecappelle wrote:

> > -config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS
> 
>  Is there no legacy handling needed?

I thought about this, but my reasoning is that since the package now
installs the DTBs unconditionally, the behavior is now the same as
having this option =y, and therefore there is no need for legacy
handling.

Did I miss something?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
