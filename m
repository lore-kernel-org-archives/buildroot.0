From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 25 May 2015 22:08:48 +0200
Subject: [Buildroot] [PATCH] package/efl/libelementary: disable on
	static lib only build
In-Reply-To: <1432389399-12671-1-git-send-email-s.martin49@gmail.com> (Samuel
 Martin's message of "Sat, 23 May 2015 15:56:39 +0200")
References: <1432389399-12671-1-git-send-email-s.martin49@gmail.com>
Message-ID: <87iobgzagf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 > libelementary sources include dlfcn.h header when HAVE_FORK symbol is defined;
 > this is always the case because elf already depends on BR2_USE_MMU.

Committed with the elf/efl typo fixed, thanks.

-- 
Bye, Peter Korsgaard
