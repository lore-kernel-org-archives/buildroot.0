From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 13 May 2014 00:19:05 +0200
Subject: [Buildroot] [PATCH] crda: disable on NIOS II
In-Reply-To: <1399932748-12406-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 13 May 2014 00:12:28 +0200")
References: <1399932748-12406-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87zjimvdwm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Building crda on NIOS II triggers the infamous _gp linker issue. Since
 > nobody cared, let's disable this package on NIOS II for the moment.

 > Fixes:

 >   http://autobuild.buildroot.net/results/272/272f18410e4855ab6b3bfd8a44243c1ebecf6abe/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
