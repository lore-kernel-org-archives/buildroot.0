From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 22 Dec 2019 21:30:42 +0100
Subject: [Buildroot] [PATCH] package/gdb: Disable gdbserver if full gdb
 is enabled for ARC
In-Reply-To: <20191202134125.2545-1-Evgeniy.Didin@synopsys.com> (Evgeniy
 Didin's message of "Mon, 2 Dec 2019 16:41:25 +0300")
References: <20191202134125.2545-1-Evgeniy.Didin@synopsys.com>
Message-ID: <878sn4yufh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Evgeniy" == Evgeniy Didin <Evgeniy.Didin@synopsys.com> writes:

 > With recent update of ARC toolchain to arc-2019.09-eng/rc1 versions
 > GDB package builds started to fail in autobuilder:
 >  http://autobuild.buildroot.net/results/bc5/bc52d0012944e15dee30a6e00a92f23c87d0dfda//

 > This error was caused by 73cc72729a18 ("Move gnulib to top level")
 > commit in binutils-gdb master branch and appears in ARC case because
 > arc-2019.09 GDB is based on binutils-gdb master branch and includes
 > this commit.

 > More information about this bug can be found there:
 > https://sourceware.org/bugzilla/show_bug.cgi?id=24729
 > https://sourceware.org/bugzilla/show_bug.cgi?id=25171
 > https://github.com/foss-for-synopsys-dwc-arc-processors/binutils-gdb/issues/30

 > Signed-off-by: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Cc: arc-buildroot at synopsys.com

Committed to 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
