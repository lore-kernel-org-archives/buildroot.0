From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 16 Jun 2008 12:15:09 +0200
Subject: [Buildroot] [PATCH] build fix for package/python
In-Reply-To: <dba6c0830806152258i78970879leb61228913545743@mail.gmail.com>
	(Conrad Parker's message of "Mon\, 16 Jun 2008 14\:58\:24 +0900")
References: <dba6c0830806152258i78970879leb61228913545743@mail.gmail.com>
Message-ID: <873andbs9e.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Conrad" == Conrad Parker <conrad@metadecks.org> writes:

Hi,

 Conrad> Removed invalid hyphen in front of -$(MAKE) in the middle of
 Conrad> a subshell; this looks like it was left over from an earlier
 Conrad> use as a standalone makefile rule, where the - would have
 Conrad> specified to allow failure.

Thanks, committed.

-- 
Bye, Peter Korsgaard
