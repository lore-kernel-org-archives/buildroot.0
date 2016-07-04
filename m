From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 04 Jul 2016 11:28:51 +0200
Subject: [Buildroot] [PATCH 0/4] System emulation support in host-qemu
In-Reply-To: <1467584664-11640-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 4 Jul 2016 00:24:20 +0200")
References: <1467584664-11640-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87vb0liwfg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > This is a respin of Simon Maes series adding system emulation support
 > to the host-qemu package. Compared to the original series from Simon:

 >  - The initial patch adding the support has been reworked, taking into
 >    account numerous comments from Arnout, plus additional
 >    simplifications and improvements.

 >  - The patch adding version selection has been dropped. We can revisit
 >    that later, but adding version selection is complicated (think
 >    about hash verification for example)

 >  - The cleanup patch from Simon has been dropped, as it didn't clean
 >    up things according to Buildroot best practices.

 >  - The patch adding the "qemu-system-run" target has been
 >    dropped. That's too specific, and if people really want to automate
 >    starting qemu, they can write a script for it outside of Buildroot.

 >  - A patch to bump to Qemu 2.6.0 has been added.

Committed series, thanks!

-- 
Bye, Peter Korsgaard
