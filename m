From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 21 Oct 2018 19:33:49 +0200
Subject: [Buildroot] How can I compile a module into the kernel?
In-Reply-To: <CAF_dkJD1hZ0+8=+j64dMffDULsfG1DufDU8po4zm8VxAfdh0dA@mail.gmail.com>
References: <CAF_dkJAn7NgNfn5d0wQDnGF7UoCuFoUZvnpvvYDgWoA7RpV4Ag@mail.gmail.com>
 <20181021095548.41d5f0b9@windsurf.lan>
 <CAF_dkJD1hZ0+8=+j64dMffDULsfG1DufDU8po4zm8VxAfdh0dA@mail.gmail.com>
Message-ID: <20181021193349.41779f48@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 21 Oct 2018 13:20:58 -0400, Patrick Doyle wrote:

> Is it possible to permanently disable loadable modules from user space
> at runtime?  Or to only load signed modules?  Or do I need to look
> more carefully at selinux?

Yes, you can lock to only load signed modules, and I think you can also
lock to no longer load any modules, i.e you can load a few modules at
boot time, and then ask the kernel to no longer load any other module.

I don't have a reference for that, but I'm pretty sure it was discussed
on LWN some $time ago.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
