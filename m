From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Nov 2011 21:15:31 +0100
Subject: [Buildroot] include the Xenomai in kernel linux
In-Reply-To: <CAOiFVFuTA9vo99MbtBhH0LQ8yH7mgk3BF_=TtzKjyeP1OBcDLw@mail.gmail.com>
References: <CAOiFVFuTA9vo99MbtBhH0LQ8yH7mgk3BF_=TtzKjyeP1OBcDLw@mail.gmail.com>
Message-ID: <20111122211531.59014007@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 22 Nov 2011 18:56:53 +0000,
Adriano Campos <adrianoribeirocampos@gmail.com> a ?crit :

> I'm trying to include the Xenomai in kernel linux with buildroot but
> I have not been successful.
> I apply the adeos patch and then compile the kernel with buildroot
> but the image is always equal and ADEOS / Xenomai not appear. Where
> should I paste the folder Xenomai?

We have support for Xenomai in Buildroot, so you don't have to patch
your kernel manually. See Kernel -> Linux Kernel Extensions ->
Adeos/Xenomai. Of course, you must select a kernel version that is
supported by Xenomai for your particular architecture.

Note that this is not available in 2011.08, only in the current
2011.11-rcX versions or the Git version of Buildroot. It will be part
of the upcoming 2011.11 release.

Don't hesitate to let us know if you have problems using this.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
