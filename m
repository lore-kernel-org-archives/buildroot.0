From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Jan 2014 07:34:22 +0100
Subject: [Buildroot] full rebuild and errors:
In-Reply-To: <52E4FA86.7030906@gmail.com>
References: <52E4FA86.7030906@gmail.com>
Message-ID: <20140127073422.6cdba910@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Marco Trapanese,

On Sun, 26 Jan 2014 13:07:34 +0100, Marco Trapanese wrote:

> I successfully compiled buildroot for Raspberry Pi following this guide:
> 
> https://github.com/albertd/buildroot-rpi
> 
> I had a problem with some applications (btw it was: EGL Error : Could 
> not create the egl surface: error = 0x300b) and I read some users were 
> able to solve just rebuilding buildroot.

The version of Buildroot you've used is a derivate of the official
Buildroot version. So there is no way we can really help you on this.
You should either use the official Buildroot version (and ask the
people who forked Buildroot to contribute their changes back to the
official version), or ask for support from the authors of the
derivative version.

If you can reproduce this problem with the official Buildroot, then we
can certainly look into it and help fixing the issue.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
