From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 31 Jan 2018 08:49:16 +0100
Subject: [Buildroot] [PATCH] package/xen: Force disable SDL for xen-qemu
 build
In-Reply-To: <20180118215230.27648-1-alistair.francis@xilinx.com> (Alistair
 Francis's message of "Thu, 18 Jan 2018 13:52:30 -0800")
References: <20180118215230.27648-1-alistair.francis@xilinx.com>
Message-ID: <877erya2o3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alistair" == Alistair Francis <alistair.francis@xilinx.com> writes:

 > Fixes autobuilder issue:
 > http://autobuild.buildroot.net/results/8bcb80dc93d38bb38ca32ad93d52c22d1176d57e/

 > Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
 > ---
 > V2:
 >  - Don't add a patch, just edit the make options

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
