From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 16 Jun 2008 12:31:47 +0200
Subject: [Buildroot] [PATCH] build fix for package/libogg
In-Reply-To: <dba6c0830806152215t614b3748j6d238f59ff342577@mail.gmail.com>
	(Conrad Parker's message of "Mon\, 16 Jun 2008 14\:15\:13 +0900")
References: <dba6c0830806152215t614b3748j6d238f59ff342577@mail.gmail.com>
Message-ID: <87y755acx8.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Conrad" == Conrad Parker <conrad@metadecks.org> writes:

Hi,

 Conrad> libogg.a is built in src/.libs/ not lib/ (libogg-1.1.3/lib
 Conrad> does not exist) cheers,

Thanks. I committed a slightly different patch (take libogg.a from
staging_dir like for the .so).

-- 
Bye, Peter Korsgaard
