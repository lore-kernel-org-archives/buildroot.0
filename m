From: Diego Iastrubni <diegoiast@gmail.com>
Date: Mon, 16 Jul 2012 09:03:31 +0300
Subject: [Buildroot] Systemd update
In-Reply-To: <CADiAo4KwLhtG-ZpaBBSRQAeDBjKW9XCxAm00ZHUKw2NF97dEMg@mail.gmail.com>
References: <CADiAo4KdxANfaB4xZyWBZe_w+y-p9UTJ1FVjcX7=KgRHkinVHQ@mail.gmail.com>
 <CALR4fEKHpNy-TyCBWigS-9gLySp_d3Amy_N=xZqSWbif-9H97A@mail.gmail.com>
 <CADiAo4KwLhtG-ZpaBBSRQAeDBjKW9XCxAm00ZHUKw2NF97dEMg@mail.gmail.com>
Message-ID: <CALR4fE+nyZZXCGVOSRJM=rir4eYE4L0_Y7K+KZE5wvmUL8dFTA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

(forwarding to the list, I hope you don't mind)


On Mon, Jul 16, 2012 at 5:15 AM, Dmitry Golubovsky <golubovsky@gmail.com>wrote:

>
> Here is dmesg output on a VM:
>
> http://pastebin.com/ZbQmMiTU
>
> [   16.881460] systemd[1]: Startup finished in 14s 40ms 662us (kernel)
> + 2s 840ms 704us (userspace) = 16s 881ms 366us.
>
> of these 16sec:
>
> [    0.392041] Trying to unpack rootfs image as initramfs...
> [   13.790005] Freeing initrd memory: 37216k freed
>
> 13 secs were spent to unpack initrd. So it could be under 10sec from
> boot to DHCP ready.
>
>
I concern is this: *is* systemd faster then traditional int?
Does paralyzing those things decrease boot time? Can this benefit the
embedded community?

I would like to review a similar setup for something like the RPI and
measure there. I need to find time for this (I am still fighting my RPI
setup... the biggest problem is that its not trivial to get a console.. so
all I have to test is my 40" TV... not ideal for kernel messages...)
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120716/301e312c/attachment.html>
