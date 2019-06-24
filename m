From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Jun 2019 21:59:05 +0200
Subject: [Buildroot] [PATCH] support/testing/infra/emulator: increase
 memory size used by Qemu
In-Reply-To: <20190621202724.19242-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Fri, 21 Jun 2019 22:27:24 +0200")
References: <20190621202724.19242-1-thomas.petazzoni@bootlin.com>
Message-ID: <878stqlppy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > By default, Qemu emulates a system with 128 MB of RAM. This is not
 > sufficient for some test cases we have, such as TestPerlDBDmysql,
 > where the initramfs is quite large. Therefore, this commit extends the
 > RAM size emulated by Qemu to 256 MB.

 > Fixes:

 >   https://gitlab.com/buildroot.org/buildroot/-/jobs/237108668

 > Thanks to Arnout for the analysis of the issue.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2019.02.x and 2019.05.x, thanks.

-- 
Bye, Peter Korsgaard
