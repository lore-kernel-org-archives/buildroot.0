From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 14 May 2015 00:37:25 +0200
Subject: [Buildroot] [PATCH] package/binutils (arc): backport PR56780
	patches
In-Reply-To: <1431552996-18992-1-git-send-email-romain.naour@openwide.fr>
 (Romain Naour's message of "Wed, 13 May 2015 23:36:36 +0200")
References: <1431552996-18992-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <87k2wcdryy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@openwide.fr> writes:

 > --disable-install-libiberty configure option is broken
 > in gcc 4.8.x, so libiberty.a is always installed in HOST_DIR.

 > This library broke the host-gdb build due to a fpic/fPIC issue.

 > Since binutils use a copy of gcc's libiberty sources, it's
 > affected by the same bug.

 > binutils-arc-2014.11 which is based on 2.23 branch doesn't have
 > the PR56780 fixies, so backport them.

 > Fixes:
 > http://autobuild.buildroot.net/results/ca4/ca45297aa0ffbc9062ed92dc7ac070b0b33001de/

 > Signed-off-by: Romain Naour <romain.naour@openwide.fr>
 > Cc: Alexey Brodkin <abrodkin@synopsys.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
