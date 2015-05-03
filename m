From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 03 May 2015 19:33:08 +0200
Subject: [Buildroot] [PATCH] gdb: disable on Blackfin
In-Reply-To: <1430663314-27156-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 3 May 2015 16:28:34 +0200")
References: <1430663314-27156-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87k2wpsh0r.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > gdbserver does not build on Blackfin FLAT (undefined reference to
 > `_td_thr_tlsbase') and while it builds on Blackfin FDPIC, it's pretty
 > unlikely that it is going to work properly with the cross-gdb provided
 > by the Analog Devices toolchain: the Analog Devices toolchain provides
 > a 6.6 cross-gdb, while we use gdb 7.8.2 for gdbserver.

 > Therefore, let's simply disable gdb completely for Blackfin.

 > Fixes:

 >   http://autobuild.buildroot.org/results/2e5/2e5310d0e869f036ec70b978c62c7bd9d3d2bd70/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
