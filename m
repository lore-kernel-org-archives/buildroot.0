From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 24 Nov 2010 22:31:53 +0100
Subject: [Buildroot] [PATCH] lrzsz: add lrz/lsz symlinks
In-Reply-To: <1290230854-10961-1-git-send-email-vapier@gentoo.org> (Mike
	Frysinger's message of "Sat, 20 Nov 2010 00:27:34 -0500")
References: <1290230854-10961-1-git-send-email-vapier@gentoo.org>
Message-ID: <87eiaa4ddi.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mike" == Mike Frysinger <vapier@gentoo.org> writes:

 Mike> Many systems support automatic zmodem transfers without needing to first
 Mike> manually run the zmodem utils.  But the expectation is to run `lrz` and
 Mike> not `rz`.  So install symlinks for lrz->rz and lsz->sz to support this.

 Mike> This also includes a small fix to also remove sz when cleaning.

Thanks, committed with small change (we normally use addprefix rather
than patsubst)

-- 
Bye, Peter Korsgaard
