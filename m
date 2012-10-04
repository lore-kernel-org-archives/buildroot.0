From: Belisko Marek <marek.belisko@gmail.com>
Date: Thu, 4 Oct 2012 19:28:57 +0200
Subject: [Buildroot] eGalax Touchscreen
In-Reply-To: <CAA8O6f7aq+f95GQMLhLMx+4ystqCcj5JOMAnLDD01dQfRHU36g@mail.gmail.com>
References: <CAA8O6f7aq+f95GQMLhLMx+4ystqCcj5JOMAnLDD01dQfRHU36g@mail.gmail.com>
Message-ID: <CAAfyv36rCrt7Rg4WCcT4jkJuQAp07Ot4Z8S_-sfLY7qQEKAQSA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Cristian

On Wed, Oct 3, 2012 at 11:39 AM, Christian M?ller
<christian.moeller.75@googlemail.com> wrote:
> Hello all
> I'm trying to setup EGalax Touchscreen. The controller-ic is an etr-4000
> usb.
> I patched the Kernel described in "eGTouch Linux Programming Guide v2.5c".
> (http://home.eeti.com.tw/web20/eGalaxTouchDriver/linuxDriver.htm)
> In dmesg output the controller is listet, but there is no /dev/uinput and no
> /dev/hidrawX devicefile.
> Device isn't also listet under /proc/bus/input/devices.
> What I have to do to get the touchscreen running?
> Any help will be welcome.
In dmesg thre is:
[    1.796470] input: eGalax Inc. USB TouchController as
/devices/pci0000:00/0000:00:1d.1/usb2/2-2/2-2:1.0/input/input6
[    1.803340] input: eGalax Inc. USB TouchController as
/devices/pci0000:00/0000:00:1d.1/usb2/2-2/2-2:1.0/input/input7
[    1.810447] input: eGalax Inc. USB TouchController as
/devices/pci0000:00/0000:00:1d.1/usb2/2-2/2-2:1.0/input/input8
[    1.817904] input: eGalax Inc. USB TouchController as
/devices/pci0000:00/0000:00:1d.1/usb2/2-2/2-2:1.0/input/input9
[    1.825684] input: eGalax Inc. USB TouchController as
/devices/pci0000:00/0000:00:1d.1/usb2/2-2/2-2:1.0/input/input10
so seems your driver works. Do you have udev (other dev management) installed?
> Best regards
> Christian
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Cheers,

marek

-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com
