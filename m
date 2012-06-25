From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Jun 2012 10:06:41 +0200
Subject: [Buildroot] [PATCH] php: force cross-compilation
In-Reply-To: <87k3yv95r9.fsf@macbook.be.48ers.dk>
References: <1340317344-22807-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <87y5ndbxgl.fsf@macbook.be.48ers.dk>
 <20120625091219.539a3740@skate>
 <87k3yv95r9.fsf@macbook.be.48ers.dk>
Message-ID: <20120625100641.7850a1a2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 25 Jun 2012 10:04:42 +0200,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

> True. Looking at the autobuilder results it seems htop has a similar
> problem (I don't quite understand why it cannot find /proc/stat on your
> builder though):
> 
> http://autobuild.buildroot.net/results/7d670efa247dfcbcbf6cd088d1157779af441333/build-end.log

I'm building in a chroot, and I don't have /proc mounted. I'm not sure
it's a useful scenario to support?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
