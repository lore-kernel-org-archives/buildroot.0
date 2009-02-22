From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 22 Feb 2009 07:48:45 +0100
Subject: [Buildroot] buildroot questions
In-Reply-To: <20090221101200.93c469aa1a7909be7482dcef974e4045.c842ca055e.wbe@email.secureserver.net>
	(gsam@ixltc.com's message of "Sat\, 21 Feb 2009 10\:12\:00 -0700")
References: <20090221101200.93c469aa1a7909be7482dcef974e4045.c842ca055e.wbe@email.secureserver.net>
Message-ID: <87fxi76k6q.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "gsam" == gsam  <gsam@ixltc.com> writes:

 gsam> Any help would be most appreciated...

 gsam> 1. Is there a log file output of the make when building from buildroot?

Not automatically, but just run

make 2>&1 | tee buildroot.log

to generate a buildroot.log of the output of make.

 gsam> 2. Is there anyway to verify the buildroot installation after make completes?

What do you exactly mean? Some way of booting the rootfs?

-- 
Bye, Peter Korsgaard
