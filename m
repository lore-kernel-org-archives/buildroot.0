From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 07 Feb 2011 14:33:46 +0100
Subject: [Buildroot] [PATCH 3/3] gdb: add support for Blackfin gdbserver
In-Reply-To: <1297057752-5850-3-git-send-email-vapier@gentoo.org> (Mike
	Frysinger's message of "Mon, 7 Feb 2011 00:49:12 -0500")
References: <1297057741-5809-1-git-send-email-vapier@gentoo.org>
	<1297057752-5850-1-git-send-email-vapier@gentoo.org>
	<1297057752-5850-3-git-send-email-vapier@gentoo.org>
Message-ID: <87ipwwvuit.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mike" == Mike Frysinger <vapier@gentoo.org> writes:

 Mike> This requires removing "deprecated" markings from gdb-6.6, but this isn't
 Mike> that big of a deal.  That is the last version with Blackfin support at the
 Mike> moment and we're in the process of getting mainlined.

I've changed it to only undeprecate for bfin - Committed, thanks.

-- 
Bye, Peter Korsgaard
