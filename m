From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Nov 2011 13:39:33 +0100
Subject: [Buildroot] include the Xenomai in kernel linux
In-Reply-To: <CAOiFVFu7BAS-MH3UE6+zYZVofDVoZvxmEHjjQ2uD5wPqo9TL2A@mail.gmail.com>
References: <CAOiFVFuTA9vo99MbtBhH0LQ8yH7mgk3BF_=TtzKjyeP1OBcDLw@mail.gmail.com>
 <CAOiFVFu7BAS-MH3UE6+zYZVofDVoZvxmEHjjQ2uD5wPqo9TL2A@mail.gmail.com>
Message-ID: <20111128133933.2dd3f976@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 28 Nov 2011 12:24:42 +0000,
Adriano Campos <adrianoribeirocampos@gmail.com> a ?crit :

>  In the 2011-08 version of buildroot works correctly using the configuration
> file "buildroot-2011-08 \ config \ qemu_arm_versatile_defconfig" supplied
> with the buildroot. However I need to apply the patch and Xenomai is not
> possible in this version so I'm now using the buildroot version 2011-11-rc3,
> but is not working.

"is not working" is not precise enough to help you. Could you provide
some details ?

> With the same configuration file, the generated image does not run under
> QEMU. Can you help?

I'm not sure you realize that Xenomai is a patch against the kernel and
that this patch is therefore only available for *certain* kernel
versions. The kernel version used in qemu_arm_versatile_defconfig has
no Xenomai patch available. If you want to use Xenomai, you *have* to
use a kernel version that is explicitly supported by Xenomai, and the
version supported by Xenomai depend on the architecture.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
