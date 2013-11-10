From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 10 Nov 2013 10:07:54 +0100
Subject: [Buildroot] [PATCH] uclibc-snapshot: enable option
	UCLIBC_HAS_OBSTACK
In-Reply-To: <527c2507.a60d440a.1787.ffff99f7@mx.google.com> (Chris Zankel's
 message of "Thu, 7 Nov 2013 14:22:12 -0800")
References: <527c2507.a60d440a.1787.ffff99f7@mx.google.com>
Message-ID: <878uwweiad.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Chris" == Chris Zankel <chris@zankel.net> writes:

 > Prior to uClibc commit f143f920694c, uClibc used to always include the
 > gnu obstack extension, which is used and required by many tools, such as
 > binutils.

 > Because of the change mentioned above, obstack is now optional, and got
 > disabled per default, so enable it in the uClibc snapshot configuration file.

Committed, thanks.

-- 
Bye, Peter Korsgaard
