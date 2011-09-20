From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Sep 2011 17:35:21 +0200
Subject: [Buildroot] Building hangs on a RHEL 6 machine
In-Reply-To: <CAJbs9BHpm3Tm-0eEA1gH-qqZf1WSnt7ny=tDuPOROocBGFLMgw@mail.gmail.com>
References: <CAJbs9BHXcxhVOCoSKFykn1TEXw=DeJCRPExkNy94h-DPOUVm+g@mail.gmail.com>
 <CAJbs9BHpm3Tm-0eEA1gH-qqZf1WSnt7ny=tDuPOROocBGFLMgw@mail.gmail.com>
Message-ID: <20110920173521.498d8647@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Tue, 20 Sep 2011 11:16:27 -0400,
Rishi <rishid+mailman@gmail.com> a ?crit :

> I am trying to build a uclibc toolchain on a Redhat 6 machine and it
> hangs. The last lines printed have been reproduced below:
> 
> The config file I am using has been attached, I built the exact same
> config file just fine on a Ubuntu 10.04 machine but my work uses
> Redhat and need to be able to build it there.  The pertinent options
> are: Buildroot toolchain, Kernel headers, 2.6.36.x, uClibc v0.9.32.x
> and default config file.
> 
> Any thoughts?

Can you post the relevant part of the "ps auxf" command executed when
the Buildroot build hangs ? I.e, the part of the process tree that
starts at the main Buildroot make command. This will allow us to see on
which process/step the build process is hanging.

I guess Redhat 6 is now publicly available, so we cannot reproduce the
problem. Do you reproduce the problem with publicly available operating
systems, such as CentOS, so that we can reproduce ?

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
