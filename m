From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 18 Dec 2013 12:08:08 +0100
Subject: [Buildroot] [PATCH] git: bump to version 1.8.5.2
In-Reply-To: <1387347280.25722.1.camel@phoenix> (Axel Lin's message of "Wed,
 18 Dec 2013 14:14:40 +0800")
References: <1387347280.25722.1.camel@phoenix>
Message-ID: <87k3f2o1rb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Axel" == Axel Lin <axel.lin@ingics.com> writes:

 > Fixes since v1.8.5.1:
 >  * "git diff -- ':(icase)makefile'" was unnecessarily rejected at the
 >    command line parser.

 >  * "git cat-file --batch-check=ok" did not check the existence of
 >    the named object.

 >  * "git am --abort" sometimes complained about not being able to write
 >    a tree with an 0{40} object in it.

 >  * Two processes creating loose objects at the same time could have
 >    failed unnecessarily when the name of their new objects started
 >    with the same byte value, due to a race condition.

 > Also contains typofixes, documentation updates and trivial code clean-ups.

 > Signed-off-by: Axel Lin <axel.lin@ingics.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
