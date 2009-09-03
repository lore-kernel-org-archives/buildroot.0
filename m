From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 03 Sep 2009 21:06:00 +0200
Subject: [Buildroot] [PATCH] package: Remove unnecessary dependencies on
	uclibc.
In-Reply-To: <87a5b0800909020804m28a05078idf9cf572b54312a7@mail.gmail.com>
	(Will Newton's message of "Wed\, 2 Sep 2009 16\:04\:23 +0100")
References: <87a5b0800909020804m28a05078idf9cf572b54312a7@mail.gmail.com>
Message-ID: <87eiqnonl3.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Will" == Will Newton <will.newton@gmail.com> writes:

 Will> Hopefully this patch isn't too large for the list.

 Will> A C library will have been built by the toolchain makefiles, so
 Will> there is no need for packages to explicitly depend on uclibc.

Thanks, committed!

-- 
Bye, Peter Korsgaard
