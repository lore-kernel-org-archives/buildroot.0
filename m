From: Quick X <quickx@hotmail.com>
Date: Tue, 2 Dec 2008 16:45:13 -0800
Subject: [Buildroot] Builroot Make Error (
Message-ID: <BAY124-W558A56205B09EF85A2940ED2030@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


make menuconfig > Target Options > Atmel Device Support > Secondary locations (*** Package support ***) > also copy the image to...
 
If this value is set to nothing "()" then you get a "mkdir -p" "mkdir: missing operand" "Error 1" problem, most the other "Copy To" Locations allow you to not copy if you wish it.
 
[...]
/home/administrator/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-objcopy --gap-fill=0xff -O srec /home/administrator/buildroot/project_build_arm/at91sam9261ek/u-boot-1.2.0-atmel/u-boot /home/administrator/buildroot/project_build_arm/at91sam9261ek/u-boot-1.2.0-atmel/u-boot.srec/home/administrator/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-objcopy --gap-fill=0xff -O binary /home/administrator/buildroot/project_build_arm/at91sam9261ek/u-boot-1.2.0-atmel/u-boot /home/administrator/buildroot/project_build_arm/at91sam9261ek/u-boot-1.2.0-atmel/u-boot.bingzip -c /home/administrator/buildroot/project_build_arm/at91sam9261ek/u-boot-1.2.0-atmel/u-boot.bin > /home/administrator/buildroot/project_build_arm/at91sam9261ek/u-boot-1.2.0-atmel/u-boot.gzmake[1]: Leaving directory `/home/administrator/buildroot/build_arm/u-boot-1.2.0-atmel'mkdir -p /home/administrator/buildroot/binaries/at91sam9261ekcp /home/administrator/buildroot/project_build_arm/at91sam9261ek/u-boot-1.2.0-atmel/u-boot.bin /home/administrator/buildroot/binaries/at91sam9261ek/at91sam9261ek-u-boot-1.2.0-atmel-20081202.binmkdir -pmkdir: missing operandTry `mkdir --help' for more information.make: *** [/at91sam9261ek-u-boot-1.2.0-atmel-20081202.bin] Error 1
_________________________________________________________________

-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20081202/a68561af/attachment.htm 
