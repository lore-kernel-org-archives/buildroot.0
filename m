From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Nov 2011 08:39:26 +0100
Subject: [Buildroot] buildroot Digest, Vol 65, Issue 104
In-Reply-To: <CAOiFVFvqVKYWY1TPBJTgYvLPz-vaXRzYsOTmDFAbufsYOiwk5A@mail.gmail.com>
References: <mailman.14523.1322494787.2942.buildroot@busybox.net>
 <CAOiFVFvqVKYWY1TPBJTgYvLPz-vaXRzYsOTmDFAbufsYOiwk5A@mail.gmail.com>
Message-ID: <20111129083926.53cb2c7a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 28 Nov 2011 18:00:44 +0000,
Adriano Campos <adrianoribeirocampos@gmail.com> a ?crit :

> root at debian:/usr/local/buildroot-2011.11-rc3/output/build/xenomai-2.6.0/ksrc/arch/arm/patches#
> ls
> README
> adeos-ipipe-2.6.35.9-arm-1.18-03.patch
> adeos-ipipe-2.6.38.8-arm-1.18-04.patch
> adeos-ipipe-2.6.37.6-arm-1.18-03.patch
> 
> You mean I can only use these three kernel versions?

Yes.

> The configuration file (qemu_arm_versatile_defconfig) is kernel v3.1.
> I have no way of putting it compactivel?

You must change v3.1 to v2.6.37.8 (easy solution) or you have to port
Adeos over to v3.1 (difficult solution).

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
