From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Aug 2015 17:16:32 +0200
Subject: [Buildroot] Bug in package tftp
In-Reply-To: <55D70AD3.2030302@gmx.de> (universe II's message of "Fri, 21 Aug
 2015 13:26:11 +0200")
References: <55D70AD3.2030302@gmx.de>
Message-ID: <87lhd0zpgv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "universe" == universe  <universeii@gmx.de> writes:

 > Dear all,
 > when adding the tftp server to my target system image I found out that
 > the tftp server is not started by the corresponding init
 > script. Reason for that is a typo in the init script. The tftp binary
 > is installed with the filename "tftpd" but the init script tries to
 > call "in.tftpd". Just fixing the name in the script solves the
 > problem. Please find below the patch for correcting the bug.

 > Regards,
 > Andreas

Fixed, thanks. In the future, please provide git formatted patches and
use your real name in From: and your Signed-off-by lines.

-- 
Bye, Peter Korsgaard
