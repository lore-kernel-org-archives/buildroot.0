From: inblueswithu <inblueswithu@hotmail.com>
Date: Sun, 29 Jan 2012 12:00:41 +0530
Subject: [Buildroot] Image created is not booting,
 waiting for infinite time
In-Reply-To: <20120128124931.5dddc20e@skate>
References: <BLU0-SMTP88C894F00679EB12CEC0A3D28F0@phx.gbl>
 <20120128124931.5dddc20e@skate>
Message-ID: <BLU0-SMTP296551C52410B48DE52F60D28C0@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Saturday 28 January 2012 05:19 PM, Thomas Petazzoni wrote:
> Most likely your kernel configuration is wrong. Please use the
> qemu_arm_versatile_defconfig available in Buildroot as an initial
> configuration, so that you start from a known-working configuration for
> the ARM Versatile platform emulated by Qemu.
Now I 've taken qemu_arm_versatile_defconfig and added few more options. 
I 've attached the .config file.
I 've got a problem here. I 've selected Kernel headers as "Linux 
2.6.37.x" in Toolchain configuration.
But in the Kernel configuration I 've selected

      [*] Linux Kernel
                    Kernel version (Same as toolchain kernel headers)  --->
              ()    Custom kernel patches
                    Kernel configuration (Using a custom config file)  --->
              (board/qemu/arm-versatile/linux-3.1.config) Configuration
    file pa
                    Kernel binary format (zImage)  --->
                    Linux Kernel Extensions  --->

But the default here is linux-3.1.config. Is that ok??

Thanks & Regards
/inblueswithu/
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120129/b50aed54/attachment-0001.html>
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: .config
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120129/b50aed54/attachment-0001.ksh>
