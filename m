From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Oct 2018 22:53:06 +0200
Subject: [Buildroot] [PATCH] package/gdb: Move 'is_regular_file' from
 common-utils.c to filestuff.c
In-Reply-To: <20180914212329.30144-1-romain.naour@gmail.com> (Romain Naour's
 message of "Fri, 14 Sep 2018 23:23:29 +0200")
References: <20180914212329.30144-1-romain.naour@gmail.com>
Message-ID: <87r2h91j9p.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > Backport the upstream patch fixing the gdb build with musl toolchains.
 > Only gdb 8.1.1 [1] and 8.2 [2] release are affected.

 > Fixes:
 > https://gitlab.com/free-electrons/toolchains-builder/-/jobs/95552308

 > [1]
 > https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commitdiff;h=2441702a72f324e41a1624dc042b334f375e2d81
 > [2]
 > https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commitdiff;h=25e3c82c0e927398e759e2d5e35623012b8683f7

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>

Committed to 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
