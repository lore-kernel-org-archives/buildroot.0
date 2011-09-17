From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 17 Sep 2011 19:23:08 +0200
Subject: [Buildroot] udev-173
In-Reply-To: <20110917163211.6e98d02c@skate> (Thomas Petazzoni's message of
 "Sat, 17 Sep 2011 16:32:11 +0200")
References: <20110917163211.6e98d02c@skate>
Message-ID: <87ehzfw0ar.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Peter,
 Thomas> udev-173 cannot be downloaded (hosted on kernel.org) and isn't
 Thomas> available on sources.buildroot.net. Can you put
 Thomas> http://ftp.halifax.rwth-aachen.de/kernel/linux/utils/kernel/hotplug/udev-173.tar.bz2
 Thomas> there so that current Buildroot can work properly ?

Ahh yes, done. I missed it as it doesn't get enabled by make
allyesconfig (because of the /dev handling options).

-- 
Bye, Peter Korsgaard
