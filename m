From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 18 Nov 2010 11:58:54 +0100
Subject: [Buildroot] [PATCH] gdb: drop local stripping in favor of top
	level
In-Reply-To: <1290076011-31508-1-git-send-email-vapier@gentoo.org> (Mike
	Frysinger's message of "Thu, 18 Nov 2010 05:26:51 -0500")
References: <1290076011-31508-1-git-send-email-vapier@gentoo.org>
Message-ID: <87tyje99u9.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mike" == Mike Frysinger <vapier@gentoo.org> writes:

 Mike> Since the top level takes care of stripping for us, and some file formats
 Mike> cannot be stripped safely (like FLAT which will error out), simply punt
 Mike> the manual stripping from the gdb package.

Committed, thanks.

-- 
Bye, Peter Korsgaard
