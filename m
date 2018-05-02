From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 02 May 2018 15:25:16 +0200
Subject: [Buildroot] [PATCH 1/1] go: bump to 1.10
In-Reply-To: <87sh7b2iz5.fsf@paral.in> (Christian Stewart's message of "Tue,
 01 May 2018 16:56:14 -0400")
References: <20180219072718.28895-1-christian@paral.in>
 <87po3js3j3.fsf@dell.be.48ers.dk> <87y3i7q8fw.fsf@dell.be.48ers.dk>
 <877eoxc3uq.fsf@paral.in> <87a7tjf8dr.fsf@dell.be.48ers.dk>
 <87sh7b2iz5.fsf@paral.in>
Message-ID: <87sh7adwar.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Christian" == Christian Stewart <christian@paral.in> writes:

 > Hi Peter,
 > Peter Korsgaard <peter@korsgaard.com> writes:
 >> It probably isn't, but if the host uses glibc and the target you build
 >> for also uses glibc (and the same architecture), then it probably works
 >> to link with the target libc instead of the host one.

 > Agreed, but it's maybe worth noting that I'm successfully compiling on
 > amd64 targeting arm and arm64.

I take it that the arm64 target uses glibc like your build machine,
E.G. similar to building for x86_64/glibc on a x86_64 machine?

-- 
Bye, Peter Korsgaard
