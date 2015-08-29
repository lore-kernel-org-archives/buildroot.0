From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 29 Aug 2015 17:42:56 +0200
Subject: [Buildroot] [PATCH 1/2] gdb: add support for gdb 7.10
In-Reply-To: <1440854486-2146-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 29 Aug 2015 15:21:25 +0200")
References: <1440854486-2146-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <877foeumm7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > This commit adds support for gdb 7.10.
 > gdb 7.9.1 carries the following patches:

 >  - 0001-gdbserver-fix-uClibc-whithout-MMU.patch
 >    merged as 6282837972a5c7b89968319caf821fcbd2a166bb, and part of 7.10

 >  - 0002-gdbserver-xtensa-drop-xtensa_usrregs_info.patch
 >    merged as deb44829ecc1dd38275af0fcf91acd319e227a89, and part of 7.10

 >  - 0003-gdbserver-xtensa-fix-typo-in-XCHAL_HAVE_LOOPS.patch
 >    merged as a2d5a9d76f2366ed93095fc5a63eafa06b22f808, and part of 7.10

 > Consequently, none of the three patches we have for 7.9.1 are useful
 > for 7.10.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed both to next, thanks.

-- 
Bye, Peter Korsgaard
