From: Anand Chaudhari <chaudhari.anand05@gmail.com>
Date: Sun, 23 Jul 2017 09:24:24 +0530
Subject: [Buildroot] error while make in builtroot
In-Reply-To: <20170722110134.78333481@windsurf>
References: <CAE5B2F-d-7VRFZ5PCwc8Ued1CTSCrP6mGpyH+2qPGHAA2mH9tQ@mail.gmail.com>
 <20170722110134.78333481@windsurf>
Message-ID: <CAE5B2F_3NWomYBGbQqzxEB63u=4wjJMu32n+qQa-XndJFUcTXA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

how to test generated rpi image file without hardware?

On Sat, Jul 22, 2017 at 2:31 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Hello,
>
> On Sat, 22 Jul 2017 13:15:52 +0530, Anand Chaudhari wrote:
> > Creating journal (4096 blocks): done
> > Copying files into the device: __populate_fs: Could not allocate block in
> > ext2 filesystem while writing file "libiconv.so.2.6.0"
> > mkfs.ext4: Could not allocate block in ext2 filesystem while populating
> > file system
>
> You have to increase the size of the filesystem image to be produced.
> See option BR2_TARGET_ROOTFS_EXT2_SIZE.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
>



-- 
 Kind Regards,
Anand M. Chaudhari
M Tech , VLSI design,
Visvesvaraya National Institute of Technology,
Nagpur, Maharashtra-440010
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170723/701a530f/attachment.html>
