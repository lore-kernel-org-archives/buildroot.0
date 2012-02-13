From: Markos Chandras <Markos.Chandras@imgtec.com>
Date: Mon, 13 Feb 2012 09:43:03 +0000
Subject: [Buildroot] [PATCH] libatomic_ops: Remove duplicate targets
Message-ID: <4F38DB27.5090707@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Please review the attached patch. libatomic_ops refuses to install
because the build system overwrites newly installed targets. The patch
removes these targets from the Makefiles and runs autoreconf to
regenerate the build system. If you need me to send the patch as a
separate file please let me know. I haven't send this to upstream yet
but I plan to do so.

-- 
markos
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: 0001-libatomic_ops-Remove-duplicate-targets.patch
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120213/7c2662cc/attachment.ksh>
