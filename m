From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 09 Jan 2014 21:14:42 +0100
Subject: [Buildroot] [PATCH] dtc: broken for static builds
In-Reply-To: <1389087873-40458-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Tue, 7 Jan 2014 09:44:33 +0000")
References: <1389087873-40458-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <87fvowc3pp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > dtc package has hardcoded shared lib link options in the Makefile, so it
 > will fail if you try to build it on a static lib environment.

Really? I just did a quick test build and it seems to work here:

file output/target/usr/bin/dtc
output/target/usr/bin/dtc: ELF 32-bit LSB executable, ARM, version 1
(SYSV), statically linked, stripped

-- 
Bye, Peter Korsgaard
