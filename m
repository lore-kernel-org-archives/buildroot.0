From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Wed, 23 Mar 2011 14:43:13 -0500
Subject: [Buildroot] proc not mouning
In-Reply-To: <1D6034426110564DA0DEA9EE9793B3835817742A3D@NBE-MBX01.americas.swk.pri>
References: <4D89170F.7080305@michaelburghart.de>
	<4D88B94A.1060609@free.fr><4D88BD19.7070901@michaelburghart.de>
	<4D88C6B3.5010103@free.fr><4D88F97B.4060605@michaelburghart.de><20110322195502.GA8662@tarshish><4D88FFC6.1010404@michaelburghart.de><20110322200337.GB8662@tarshish><4D8904BF.5060503@michaelburghart.de><4D898F3C.8010603@michaelburghart.de><20110323171608.GC3225@nataf.siach.name>
	<1D6034426110564DA0DEA9EE9793B383581774296C@NBE-MBX01.americas.swk.pri>
	<9AC3F0E75060224C8BBC5BA2DDC8853A1F99A012@EXV1.corp.adtran.com>
	<1D6034426110564DA0DEA9EE9793B3835817742A3D@NBE-MBX01.americas.swk.pri>
Message-ID: <9AC3F0E75060224C8BBC5BA2DDC8853A1F99A02F@EXV1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> > Are you mounting proc FIRST in inittab?
> >
> > Andy
> 
> Yes.
> 
> From inittab:
> 
> # Startup the system
> null::sysinit:/bin/mount -t proc proc /proc
> null::sysinit:/bin/mount -o remount,rw /
> null::sysinit:/bin/mkdir -p /dev/pts
> null::sysinit:/bin/mount -a
> null::sysinit:/bin/hostname -F /etc/hostname
> # now run any rc scripts
> ::sysinit:/etc/init.d/rcS
> 
> /carl h.
> 

Bummer.

Okay, what does this line do:

>>  Switching to filesystem on SD card....

Do you have a script file for that?
