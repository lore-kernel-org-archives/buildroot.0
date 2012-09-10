From: Belisko Marek <marek.belisko@gmail.com>
Date: Mon, 10 Sep 2012 15:03:29 +0200
Subject: [Buildroot] Uncompressed kernel image for ARM architecture
	(Raspberry)
In-Reply-To: <CAMPeO9yjDwyhqpA0nOwLcp25cponBsP_OC_J4T7+22Jj_OzoaA@mail.gmail.com>
References: <CAMPeO9yjDwyhqpA0nOwLcp25cponBsP_OC_J4T7+22Jj_OzoaA@mail.gmail.com>
Message-ID: <CAAfyv34EEAb4foJqdxLjkJa1yHZkEM8tH=ptGJWTmP_S_NcL7w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi David,

On Mon, Sep 10, 2012 at 3:01 PM, David Sanchez Herrero
<david.krusty@gmail.com> wrote:
> Hi all,
>
> Is there a way to obtain uncompressed kernel image for ARM architecture?
>
> I'm trying to build a kernel and a root filesystem for Raspberry Pi from an
> internal buildroot toolchain with uClibc, but the only supported formats for
> the output kernel image are vmlinux, uImage and zImage.
>
> Downloading the kernel sources from the Raspberry Git repositories, and
> building them manually, an image file called "Image" is generated under
> ".arch/arm/boot/" folder, but this file doesn't exists if the building
> process of the same sources is made by Buildroot.
Currently I have in my queue patches for RPI bootloader + kernel. Need
to do some testing
and the I'll post it to ML.
>
> Maybe using BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM?
>
> Thanks in advance.
>
> Greeting, David.
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Regards,

mbe

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
