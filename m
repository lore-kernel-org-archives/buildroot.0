From: Patricia Holden <patholdn@gmail.com>
Date: Fri, 12 Jun 2015 18:00:57 -0400
Subject: [Buildroot] Building bootable usb drive for target board with
	ext2
In-Reply-To: <20150612235154.1a723af5@free-electrons.com>
References: <CANKYLME21pAifC-tb+HC=tRhy5k9ka0W-gywZCPrOdpq1aOTMA@mail.gmail.com>
 <20150612211031.3a684e7d@free-electrons.com>
 <CANKYLMF9crxgDKVuHBZHHkhh=iw=O_o=Sq0cafM_HusVWAPd2w@mail.gmail.com>
 <CANKYLME+Dh85AHMX5yQdwuBU_WbsbMLurUf8d6Hn3pf=Ybpw8A@mail.gmail.com>
 <20150612235154.1a723af5@free-electrons.com>
Message-ID: <CANKYLMH6FjPqpznQqb9N5zx_qReM8u0XsttVofVv3UA8UKgOpA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I did read the help instructions for both grub & grub2 but wasn't sure if
it would translate to the USB.  I'll see what I can do, thank you so much!

On Fri, Jun 12, 2015 at 5:51 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear Patricia Holden,
>
> On Fri, 12 Jun 2015 17:49:57 -0400, Patricia Holden wrote:
>
> > Ok, so I'm still not quite out of the woods.  I copied over the boot
> > directory from output to my usb drive, copied bzImage to usb drive.  It
> > hangs on target.  Do I need to edit grub files for the usb?  Do I need to
> > install grub instead of copying?  Sorry for such mundane questions, but
> I'm
> > just getting back into the linux world and my mind is a bit foggy.
>
> You need to install grub on your USB drive. See the instructions in the
> grub option help text, also visible at:
>
>   http://git.buildroot.net/buildroot/tree/boot/grub/Config.in#n8
>
> The instructions are done on a disk image, but it can be done directly
> on a real drive in a similar way.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150612/22c93240/attachment.html>
