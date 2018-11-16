From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 16 Nov 2018 22:30:23 +0100
Subject: [Buildroot] [PATCH] libsigsegv: add RISC-V support
In-Reply-To: <20181113213510.21886-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Tue, 13 Nov 2018 22:35:10 +0100")
References: <20181113213510.21886-1-thomas.petazzoni@bootlin.com>
Message-ID: <871s7ksob4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > This commit backports an upstream commit adding RISC-V support to
 > libsigsegv, and adds a patch that finalizes the RISC-V support to make
 > it compatible with cross-compilation.

 > Fixes:

 >   http://autobuild.buildroot.net/results/bd12cb3db3b46860a4ab8fb91052319dce75202a/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
