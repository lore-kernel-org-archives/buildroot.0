From: akennedy at wpid-am.com <akennedy@wpid-am.com>
Date: Fri, 14 Jan 2011 12:08:33 -0600
Subject: [Buildroot] [PATCH] kexec: bump to version 2.0.2 + change URL to
	match kernel.org
Message-ID: <1295028514-14006-1-git-send-email-akennedy@wpid-am.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changed the KEXEC_SITE to the new home of kexec.  This patch also satisfies
bug id=3007 created by me last month.  Thanks to Gustavo for pointing out
that the easy fix was to bump kexec to 2.0.2.

Signed-off-by: Andy Kennedy <andy.kennedy@adtran.com> <akennedy@wpid-am.com>
