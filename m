From: Adriano Campos <adrianoribeirocampos@gmail.com>
Date: Mon, 28 Nov 2011 12:24:42 +0000
Subject: [Buildroot] include the Xenomai in kernel linux
In-Reply-To: <CAOiFVFuTA9vo99MbtBhH0LQ8yH7mgk3BF_=TtzKjyeP1OBcDLw@mail.gmail.com>
References: <CAOiFVFuTA9vo99MbtBhH0LQ8yH7mgk3BF_=TtzKjyeP1OBcDLw@mail.gmail.com>
Message-ID: <CAOiFVFu7BAS-MH3UE6+zYZVofDVoZvxmEHjjQ2uD5wPqo9TL2A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hello,

I am developing a project you need to create an image of the Linux kernel and
a small file system running on the emulator QEMU.

 In the 2011-08 version of buildroot works correctly using the configuration
file "buildroot-2011-08 \ config \ qemu_arm_versatile_defconfig" supplied
with the buildroot. However I need to apply the patch and Xenomai is not
possible in this version so I'm now using the buildroot version 2011-11-rc3,
but is not working. With the same configuration file, the generated image does
not run under QEMU. Can you help?

Best regards,
Adriano Campos
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111128/a56cfd12/attachment.html>
