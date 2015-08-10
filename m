From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 Aug 2015 15:57:59 +0200
Subject: [Buildroot] [PATCH 1/1] package/rpi-firmware: add configurable
 kernel cmdline option
In-Reply-To: <20150809162240.GB4299@free.fr>
References: <1439135221-29285-1-git-send-email-ivo.slanina@gmail.com>
 <20150809162240.GB4299@free.fr>
Message-ID: <20150810155759.60fb13ec@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 9 Aug 2015 18:22:40 +0200, Yann E. MORIN wrote:

> No. Such tweaking should be left for a post-build script.
> 
> And *if* we were to have a mean to set the kernel command line in
> Buildroot, it should not be specific to the RPi. It should be a generic
> solution, that could be used for all bootloaders. I.e. an entry in the
> kernel menu.
> 
> But I'm not really a fan of this; post-build scripts have been
> introduced just for this kind of local customisation. Others may
> disagree, though...

Fully agreed.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
