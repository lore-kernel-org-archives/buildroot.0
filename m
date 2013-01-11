From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Jan 2013 17:01:34 +0100
Subject: [Buildroot] [PATCH v2] configs: add RaspberryPi defconfig
In-Reply-To: <50F02D70.9080406@je-eigen-domein.nl>
References: <1357910250-31110-1-git-send-email-maxime.hadjinlian@gmail.com>
 <50F02D70.9080406@je-eigen-domein.nl>
Message-ID: <20130111170134.22999870@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Floris Bos,

On Fri, 11 Jan 2013 16:19:12 +0100, Floris Bos wrote:
> On 01/11/2013 02:17 PM, Maxime Hadjinlian wrote:
> >      - Add 'kernel=zImage' in config.txt (without quotes).
> 
> Perhaps consider making that the default in package/rpi-firmware/config.txt
> 
> So that one can create a working Raspberry Pi image by just copying the 
> files from target to a FAT formatted SD card without having to edit or 
> rename anything.

I agree. Let's have a default config.txt that matches the file name of
the kernel image we generate.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
