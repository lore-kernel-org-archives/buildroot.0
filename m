From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Apr 2011 21:57:03 +0200
Subject: [Buildroot] [HALd] Slow startup (>4min.)
In-Reply-To: <1301995387.4891.40.camel@esp-patben-lin.espdx1.local>
References: <1301995387.4891.40.camel@esp-patben-lin.espdx1.local>
Message-ID: <20110405215703.19ccce2e@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 05 Apr 2011 11:23:07 +0200
Patryk Benderz <Patryk.Benderz@esp.pl> wrote:

> I am using for this compilation BR snapshoot from 2011-03-30.
> 	I was struggling with hald slow startup for few past days and
> wasn't able to find out any answer in my favourite search engine ;).
> HAL startup takes exactly 4 minutes and 10 seconds on x86 target. HAL
> doesn't write out any info during startup
> 	Maybe someone here already have ready answer - what am I
> missing to start HAL quickly?

Could you run it through strace to see what's going on ?

However, notice that HAL is deprecated these days. For what usage do
you need HAL ?

I'm currently packaging udisks and all related dependencies, so that
signalisation of block device events can be propagated on D-Bus.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
