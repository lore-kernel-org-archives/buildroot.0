From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 30 Mar 2012 08:27:22 +0200
Subject: [Buildroot] [git commit] sudo: bump to version 1.8.4p4
In-Reply-To: <20120330011500.07b6e26b@skate> (Thomas Petazzoni's message of
 "Fri, 30 Mar 2012 01:15:00 +0200")
References: <20120329154644.B0407969A7@busybox.osuosl.org>
 <20120330011500.07b6e26b@skate>
Message-ID: <87obreeh85.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> I don't know if it is caused by this bump version or if the
 Thomas> problem was present before, but:

 Thomas>  http://autobuild.buildroot.org/results/d5a7831701e4c3b147451f4f021aa644672005ae/build-end.log
 Thomas>  http://autobuild.buildroot.org/results/521b2a317fe2464c13e6fecd0c80ee2bac229522/build-end.log
 Thomas>  http://autobuild.buildroot.org/results/10469a7a62f43200e17d94fcb0460f2e032bac4d/build-end.log

 Thomas> I don't think I have seen sudo build failures before this bump through
 Thomas> the autobuild tests.

The new sudo needs the utmpx stuff I recently added to the uClibc
defconfigs for systemd. I will rebuild my i686 toolchain on gcc110
today.

-- 
Bye, Peter Korsgaard
