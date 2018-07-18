From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 18 Jul 2018 23:37:42 +0200
Subject: [Buildroot] [PATCH] uboot: don't override HOSTCC/HOSTLDFLAGS
 for kconfig
In-Reply-To: <20180624141242.16851-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 24 Jun 2018 16:12:42 +0200")
References: <20180624141242.16851-1-peter@korsgaard.com>
Message-ID: <87lga8gr89.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > So the host ncurses includes and library are used instead of a mix of both,
 > causing corrupted characters.  Similar to the linux fix in commit
 > 6d3d09e23213e8 (linux: don't override HOSTCC for kconfig), except that we
 > pass the linker flags in HOSTLDFLAGS.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2018.02.x and 2018.05.x, thanks.

-- 
Bye, Peter Korsgaard
