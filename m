From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 11 Jan 2011 10:52:46 +0100
Subject: [Buildroot] [PATCH 2/7] busybox: let buildroot handle stripping
In-Reply-To: <1294669725-5379-2-git-send-email-vapier@gentoo.org> (Mike
	Frysinger's message of "Mon, 10 Jan 2011 09:28:40 -0500")
References: <1294669718-5339-1-git-send-email-vapier@gentoo.org>
	<1294669725-5379-1-git-send-email-vapier@gentoo.org>
	<1294669725-5379-2-git-send-email-vapier@gentoo.org>
Message-ID: <87sjwz3gy9.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mike" == Mike Frysinger <vapier@gentoo.org> writes:

 Mike> For some ABI's (like FLAT), we cannot strip busybox as the file format
 Mike> does not support it and strip will abort with errors like 'File format
 Mike> not recognized'.  Since the toplevel already takes care of stripping
 Mike> things, simply disable the busybox step.

Committed, thanks.

-- 
Bye, Peter Korsgaard
