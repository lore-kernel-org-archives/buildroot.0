From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Jun 2013 18:30:15 +0200
Subject: [Buildroot] Xenomai package not extracted in time
In-Reply-To: <02de01ce6dd0$bb38f3a0$31aadae0$@spamcop.net>
References: <02de01ce6dd0$bb38f3a0$31aadae0$@spamcop.net>
Message-ID: <20130620183015.0dc4cfc2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear gpontis at spamcop.net,

On Thu, 20 Jun 2013 09:10:50 -0700, gpontis at spamcop.net wrote:
> I'm working with buildroot 2013.05, ARM, and Xenomai 2.6.2.1. As part of
> making Xenomai go, there is a kernel patch. I keep that patch under my board
> directory and point to it with BR2_LINUX_KERNEL_EXT_XENOMAI_ADEOS_PATCH. The
> build is failing because a script (from Xenomai) that is used to apply this
> patch is not available. It is not available because the Xenomai package has
> not been extracted yet. If I manually extract the Xenomai package once then
> all goes ahead smoothly. A few versions back of Xenomai and buildroot, this
> worked automatically. I don't know if I broke something or if the BR
> environment has somehow changed. But can someone offer guidance on how to
> fix it so he manual step is not necessary ?

Can you share a .config (with all the necessary things) so that we can
reproduce the issue?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
