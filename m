From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 14 Sep 2014 22:59:27 +0200
Subject: [Buildroot] [PATCH] uclibc: fix duplicate vfork problems when
	static linking
In-Reply-To: <20140901200606.GA14078@waldemar-brodkorb.de> (Waldemar
 Brodkorb's message of "Mon, 1 Sep 2014 22:06:06 +0200")
References: <20140901200606.GA14078@waldemar-brodkorb.de>
Message-ID: <87sijt5368.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

 > Reported on uClibc mailinglist by Thomas Petazzoni
 > Should fix:
 > * SuperH
 >  http://autobuild.buildroot.org/results/a81/a810c2f27dee1978808461c05cbdcbf51a214e09/build-end.log
 > * i386
 >  http://autobuild.buildroot.org/results/f83/f83b65bfc6ea7c7406a02e92afda43e4c5db6e7c/build-end.log
 > * x86-64
 >  http://autobuild.buildroot.org/results/64f/64f418f54885e8b5093dc8949c2d1d1ff3c938ea/build-end.log
 > * powerpc
 >  http://autobuild.buildroot.org/results/d5b/d5b7ac84dde0e4e26cd7cc46d79e66c39ed5cd53/build-end.log

 > Tested with i386 static build of alsa-utils.
 > Patch will be send to uClibc soon, need to finish test-suite run.

 > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Committed, thanks.

-- 
Bye, Peter Korsgaard
