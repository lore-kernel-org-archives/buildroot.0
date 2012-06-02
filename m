From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Jun 2012 15:41:59 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2012-06-01
In-Reply-To: <20120602063108.846A352CE66@lolut.humanoidz.org>
References: <20120602063108.846A352CE66@lolut.humanoidz.org>
Message-ID: <20120602154159.71af36b2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Sat,  2 Jun 2012 08:31:08 +0200 (CEST),
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> a ?crit :

> On 2012-06-01, 125 random build tests have been done and
> submitted on autobuild.buildroot.net.
>  38 builds have been successful
>  87 builds have failed

We clearly see that the 'next' branch has been merged into the master
branch :-)

In a summary, the most important build problems are listed below. I'm
Cc'ing the relevant package developers.

 * linphone

   unknown reason:
   http://autobuild.buildroot.org/results/6fa45a2e93ec58288f1b2466c0538a296ffd3edf/build-end.log

   missing dependency on host-intltool
   http://autobuild.buildroot.org/results/eff8229a934b8580d3ff4b4ba8d269750006bcca/build-end.log

   unknown reason:
   http://autobuild.buildroot.org/results/27c8ec0e5130406739e0bf6239844b3557e90f20/build-end.log

 * quagga

   probably an IPv6 dependency problem
   http://autobuild.buildroot.org/results/62e690750c1e00a97804cb2d6b2971e84dd6a117/build-end.log

 * php

   some sort of snmp dependency problem
   http://autobuild.buildroot.org/results/efc3b0cdc8f54f3cea34efa6a41361acc1c9a87c/build-end.log

   xml library dependency problem ?
   http://autobuild.buildroot.org/results/4e2e7c563f96e7344606e18f6439a3bffdcc19ec/build-end.log

 * connman

   http://autobuild.buildroot.org/results/6193b7a612efb53f603ae44418516123830c9f62/build-end.log

   ipv6 problem
   http://autobuild.buildroot.org/results/985160e7d0fba4396237c3afe04f3063beacfd97/build-end.log

 * libnfc

   missing readline dependency (or, if possible, get rid of this
   dependency)
   http://autobuild.buildroot.org/results/1acf5e37b60014624382b73fd040191261612094/build-end.log

 * pulseaudio

   http://autobuild.buildroot.org/results/b17fa9106bab1bea07c08770d92e066d51b576df/build-end.log

 * collectd

   missing dependencies
   http://autobuild.buildroot.org/results/2c060a279e1593c013746f5f87251323ecca152a/build-end.log

 * omap-utils

   http://autobuild.buildroot.org/results/675373b46e1115059d8a2eceb3ac35519fa86002/build-end.log

 * webrtc

   not supported on all architectures
   http://autobuild.buildroot.org/results/c93f8f41e5aa47f351c9f5b0db14b5cf18b1784c/build-end.log

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
