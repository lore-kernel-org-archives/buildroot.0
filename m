From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 20 May 2014 00:31:30 +0200
Subject: [Buildroot] [PATCH 2/2] gdb: switch to 7.x for Blackfin
In-Reply-To: <1400537239-24812-2-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 20 May 2014 00:07:19 +0200")
References: <1400537239-24812-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1400537239-24812-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87vbt1ienx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > For some reason, we were keeping gdb version 6.6a specially for
 > Blackfin. However, it turns out that support for Blackfin was merged
 > in gdb 7.4 (cross-gdb and gdbserver, not native gdb on the
 > target). Therefore, we can simply remove the support for version 6.6a
 > and use 7.5 as the default.

 > Both 7.4 and 7.5 were built tested, including cross-gdb and gdbserver.

 > The original reason to switch to 7.x is that 6.6a doesn't build for
 > Blackfin FLAT, and while it builds for Blackfin FDPIC, it only builds
 > libiberty.a and does not actually build a cross debugger.

 > Fixes:

 >   http://autobuild.buildroot.org/results/b47/b47f85553336b7f63ee4ecdf8598374ce4a225a3/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
