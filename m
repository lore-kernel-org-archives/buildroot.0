From: Steve Calfee <stevecalfee@gmail.com>
Date: Thu, 21 May 2015 08:16:47 -0700
Subject: [Buildroot] Configure WiFi for AP on boot
In-Reply-To: <CANT5W8gNodadKUCfxJ8hyN5DTCuCUVMhW27WvfgFyWvkoc2JcQ@mail.gmail.com>
References: <CANT5W8gNodadKUCfxJ8hyN5DTCuCUVMhW27WvfgFyWvkoc2JcQ@mail.gmail.com>
Message-ID: <CAJJ6jxuj8=xP2fw+mkDFtBf5xhQ3rdV9Qfbj95yD9xUWBCfk8Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

What you want is the rpi to be an access point. Look at hostapd.

Maybe this will help:
http://www.daveconroy.com/turn-your-raspberry-pi-into-a-wifi-hotspot-with-edimax-nano-usb-ew-7811un-rtl8188cus-chipset/

Regards, Steve

On Wed, May 20, 2015 at 11:42 PM, Henrik Aagaard J?rgensen
<henrikaagaardjorgensen@gmail.com> wrote:
> Dear buildroot-community.
>
> I'm just trying out buildroot for the very first time, for my Raspberry Pi
> 2.
>
> Everything seems quite easy to work with and I've compiled my very first
> Linux system.
>
> However, I would like to have the system create a Wireless network, which I
> can SSH into on boot.
>
> I've added WiFi by following this guide:
> http://www.digitalpeer.com/blog/wireless-on-raspberry-pi-with-buildroot
>
> However, I still need to SSH into the Pi with ethernet at the very first
> logon, to setup WiFi.
>
> Is it possible to have the Pi show itself for SSH login?
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
