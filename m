From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 11 Jun 2014 22:25:43 +0200
Subject: [Buildroot] [PATCH] supervisor: add runtime dependency on
	python-setuptools
In-Reply-To: <7514f33bf3a507a044a5.1402514267@localhost> (Thomas De
 Schampheleire's message of "Wed, 11 Jun 2014 21:17:47 +0200")
References: <7514f33bf3a507a044a5.1402514267@localhost>
Message-ID: <87bntzgpmg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > supervisor has a runtime dependency on python-setuptools which was not
 > expressed in its Config.in file. When running supervisor without setuptools,
 > one gets:

 > Starting supervisord: Traceback (most recent call last):
 >   File "/usr/bin/supervisord", line 5, in <module>
 >     from pkg_resources import load_entry_point
 > ImportError: No module named pkg_resources

 > Partially fixes bug #7184 (https://bugs.busybox.net/show_bug.cgi?id=7184)

 > Reported-by: Sebastian Himberger <sebastian@himberger.de>
 > Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
