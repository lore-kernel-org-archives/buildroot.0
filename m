From: Ulf Samuelsson <ulf@atmel.com>
Date: Fri, 18 Jan 2008 19:01:28 +0100
Subject: [Buildroot] Basic question about buildroot
References: <1CD05B980C94AC408B37C82BBABAA3E609B6CAE2@mtsexchange.dc.multitech.prv>
Message-ID: <000701c85a70$4b0ab8d0$76012b0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> What is the purpose of the defconfig files in the target/device
> directories of buildroot? Are they supposed to be used to set up a
> baseline configuration for specific target boards?

If you do 

$ make <board>_defconfig

the target directory will be searched, and if found the
file will be copied to ".config" so you do not have to enter

$ make menuconfig 

and fix tings from scratch every time you download a new buildroot tarball.


> Timothy Barr
> Hardware Development Engineer
> for Multi-Tech Systems, Inc.
>  <mailto:tbarr@multitech.com> tbarr at multitech.com 

Best Regards
Ulf Samuelsson
