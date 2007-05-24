From: Steven J. Hill <sjhill@realitydiluted.com>
Date: Thu, 24 May 2007 14:24:46 -0500
Subject: [Buildroot] build failed on the latest svn version using uclibc
	0.9.29/NPTL
In-Reply-To: <mailman.1.1180033203.6107.buildroot@uclibc.org>
References: <mailman.1.1180033203.6107.buildroot@uclibc.org>
Message-ID: <20070524192446.GA19994@real.realitydiluted.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

NPTL only works on MIPS, SuperH and ARM. PowerPC is being worked, but
the x86 architecture is not supported at this time.

-Steve
