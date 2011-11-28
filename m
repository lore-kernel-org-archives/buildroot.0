From: Adriano Campos <adrianoribeirocampos@gmail.com>
Date: Mon, 28 Nov 2011 18:00:44 +0000
Subject: [Buildroot] buildroot Digest, Vol 65, Issue 104
In-Reply-To: <mailman.14523.1322494787.2942.buildroot@busybox.net>
References: <mailman.14523.1322494787.2942.buildroot@busybox.net>
Message-ID: <CAOiFVFvqVKYWY1TPBJTgYvLPz-vaXRzYsOTmDFAbufsYOiwk5A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>
> Le Mon, 28 Nov 2011 12:24:42 +0000,
> Adriano Campos <adrianoribeirocampos@gmail.com> a ?crit :
>
> >  In the 2011-08 version of buildroot works correctly using the
> configuration
> > file "buildroot-2011-08 \ config \ qemu_arm_versatile_defconfig" supplied
> > with the buildroot. However I need to apply the patch and Xenomai is not
> > possible in this version so I'm now using the buildroot version
> 2011-11-rc3,
> > but is not working.
>
> "is not working" is not precise enough to help you. Could you provide
> some details ?
>
> > With the same configuration file, the generated image does not run under
> > QEMU. Can you help?
>
> I'm not sure you realize that Xenomai is a patch against the kernel and
> that this patch is therefore only available for *certain* kernel
> versions. The kernel version used in qemu_arm_versatile_defconfig has
> no Xenomai patch available. If you want to use Xenomai, you *have* to
> use a kernel version that is explicitly supported by Xenomai, and the
> version supported by Xenomai depend on the architecture.
>
> hello,
thanks for reply.
Checking the folder Xenomai ...

root at debian:/usr/local/buildroot-2011.11-rc3/output/build/xenomai-2.6.0/ksrc/arch/arm/patches#
ls
README
adeos-ipipe-2.6.35.9-arm-1.18-03.patch
adeos-ipipe-2.6.38.8-arm-1.18-04.patch
adeos-ipipe-2.6.37.6-arm-1.18-03.patch

You mean I can only use these three kernel versions?
The configuration file (qemu_arm_versatile_defconfig) is kernel v3.1. I
have no way of putting it compactivel?
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111128/5de86d48/attachment.html>
