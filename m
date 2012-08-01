From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Aug 2012 09:59:44 +0200
Subject: [Buildroot] Another gpsd build failure
Message-ID: <20120801095944.06e08366@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Simon,

At
http://autobuild.buildroot.org/results/64e7d0f0272ecafade2fbb58dfd9d72578d6c3fd/build-end.log,
you'll find another gpsd build failure. I am not sure what the reason
is. Maybe that host-python has been built prior to gpsd, leading to
gpsd finding a host Python with insufficient packages. Would be good to
investigate this.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
