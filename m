From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Dec 2012 23:07:30 +0100
Subject: [Buildroot] [PATCH] toolchain-crosstool-ng: update PPL and
 CLoog versions in default configs
In-Reply-To: <201212202111.57697.yann.morin.1998@free.fr>
References: <1355959792-13804-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <201212202056.00373.yann.morin.1998@free.fr>
 <201212202111.57697.yann.morin.1998@free.fr>
Message-ID: <20121220230730.1ebc586b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Thu, 20 Dec 2012 21:11:57 +0100, Yann E. MORIN wrote:

> > The eglibc build is broken for a defconfig:
> >     /tmpfs/ccvkz3ro.s:33: Error: CFI instruction used without
> >     previous .cfi_startproc
> > But that's another issue.
> 
> Well, my bad, it's the glibc build that is broken.

I admit I had tested an eglibc build and an uClibc build, but I thought
it was ok to validate the PPL+CLoog thing, which is independent from
the C library problem.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
