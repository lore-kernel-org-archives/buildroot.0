From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 25 Jun 2012 10:04:42 +0200
Subject: [Buildroot] [PATCH] php: force cross-compilation
In-Reply-To: <20120625091219.539a3740@skate> (Thomas Petazzoni's message of
 "Mon, 25 Jun 2012 09:12:19 +0200")
References: <1340317344-22807-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <87y5ndbxgl.fsf@macbook.be.48ers.dk> <20120625091219.539a3740@skate>
Message-ID: <87k3yv95r9.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> Well, since we can't easily change the configure.in file and
 Thomas> regenerate the configure script (due to the very old version of
 Thomas> autoconf that PHP developers use), I'm not sure it's really
 Thomas> worth the effort. But on the other hand, it's true that it
 Thomas> would potentially make it possible to have the patch upstream.

True. Looking at the autobuilder results it seems htop has a similar
problem (I don't quite understand why it cannot find /proc/stat on your
builder though):

http://autobuild.buildroot.net/results/7d670efa247dfcbcbf6cd088d1157779af441333/build-end.log

-- 
Bye, Peter Korsgaard
