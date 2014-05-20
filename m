From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 20 May 2014 09:41:53 +0200
Subject: [Buildroot] [PATCH] samba: disable on AVR32
In-Reply-To: <1400570423-26735-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 20 May 2014 09:20:23 +0200")
References: <1400570423-26735-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87iop0j3r2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > samba produces particularly large binaries, and the relocations needed
 > for it do not fit in the possible relocation mechanisms available on
 > AVR32. Since samba is very unlikely to be used on AVR32, let's just
 > disable it, as we've already done for samba4.

 > Fixes:

 >   http://autobuild.buildroot.net/results/0142b1d5b8c3f20f1bff76ece646d901407f7490/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
