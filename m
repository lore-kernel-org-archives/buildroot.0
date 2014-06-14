From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Jun 2014 12:08:29 +0200
Subject: [Buildroot] [PATCH 0/20 v2 RFC] Introduce libudev (branch
 yem/libudev)
In-Reply-To: <20140614100521.GA3503@free.fr>
References: <cover.1402699915.git.yann.morin.1998@free.fr>
 <20140614100107.20b3c3be@free-electrons.com>
 <20140614100521.GA3503@free.fr>
Message-ID: <20140614120829.2b135ebe@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat, 14 Jun 2014 12:05:21 +0200, Yann E. MORIN wrote:

> > To be honest, I am far from being a udev expert, but I have a question
> > about the rationale behind a libudev-only configuration.
> 
> It is my understanding that libudev is not used to talk to a udev
> daemon, but is used to present a view of sysfs, instead of leaving
> all application reinvent their own walking of /sys, and libudev also
> provides monitoring of devices:
>     http://www.signal11.us/oss/udev/

Hum, ok, makes sense. It just uses sysfs and that's it. Thanks for the
explanation!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
