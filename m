From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 09 Dec 2016 20:08:39 +0100
Subject: [Buildroot] [PATCH v4] package/xen: Disable Werror checking
In-Reply-To: <1481237219-8699-1-git-send-email-alistair.francis@xilinx.com>
 (Alistair Francis's message of "Thu, 8 Dec 2016 14:46:59 -0800")
References: <1481237219-8699-1-git-send-email-alistair.francis@xilinx.com>
Message-ID: <878trogbt4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alistair" == Alistair Francis <alistair.francis@xilinx.com> writes:

 > The strict unused-const-variable checking was causing autobuilder errors
 > when trying to build Xen tools/libxl as the migrate_*[] arrays are not
 > always accessed.

 > To avoid the error edit the Makefile to stop all general warnings being treated
 > as errors, by removing the -Werror flag.

 > Fixes:
 >   http://autobuild.buildroot.net/results/0e0/0e0d4aa4a05da5804821951289c0a4049b009c61/

 > Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
 > ---
 > V4:
 >  - Just remove -Werror flag

Committed, thanks.

-- 
Bye, Peter Korsgaard
