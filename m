From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Jan 2012 00:20:20 +0100
Subject: [Buildroot] [PATCH 1/3] xenomai: bump to 2.6.0
In-Reply-To: <87sjjrgv2b.fsf@macbook.be.48ers.dk>
References: <cover.1325623724.git.thomas.petazzoni@free-electrons.com>
 <cover.1325623724.git.thomas.petazzoni@free-electrons.com>
 <cd40e28044a3cbd6a93176e2ff4320e4231ac8f4.1325623724.git.thomas.petazzoni@free-electrons.com>
 <87sjjrgv2b.fsf@macbook.be.48ers.dk>
Message-ID: <20120108002020.13ad49ee@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sat, 07 Jan 2012 20:40:44 +0100,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

> It would have been to mention why the ARM variant stuff is no longer
> needed, but ok - Committed, thanks.

The --enable-arm-mach option has been removed, and the --enable-arm-tsc
option is only useful is very specific situations. See:
http://git.xenomai.org/?p=xenomai-2.6.git;a=commitdiff;h=1f988e5b616a884fb13b85056757349b6312a592

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
