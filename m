From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 10 Mar 2013 23:45:13 +0100
Subject: [Buildroot] [PATCH] <pkg>-rsync: exclude version control files
In-Reply-To: <51378135.6070006@mind.be> (Arnout Vandecappelle's message of
 "Wed, 06 Mar 2013 18:47:33 +0100")
References: <f9ac20b69b1bfd3f77ef.1362169598@BEANTN0L019720>
 <871ubv9bk0.fsf@dell.be.48ers.dk> <51378135.6070006@mind.be>
Message-ID: <87fw02vpqe.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> I don't personally use this, but doesn't that break stuff using the
 >> version info (like E.G. the kernel storing the git id)?

 Arnout>  Depends on what you call breaking. The kernel will find
 Arnout> buildroot's git ID, which is fine by me (that's of course
 Arnout> assuming the output directory is a subdirectory of the
 Arnout> buildroot directory). Or failing that, it will use the plain
 Arnout> version number. The latter is actually what I prefer, because
 Arnout> it means I can easily exchange modules with the non-OVERRIDE'n
 Arnout> kernel.

Ok, but it will atleast change the current behaviour, which people might
rely on..

What do others say?

-- 
Bye, Peter Korsgaard
