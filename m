From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 15 Feb 2012 17:07:34 +0100
Subject: [Buildroot] 2012.02rc1 socat build problems with uclibc 0.9.33
In-Reply-To: <4F3B9994.3010706@edag.de> (Peter Katzmann's message of "Wed, 15
 Feb 2012 12:40:04 +0100")
References: <4F3B9994.3010706@edag.de>
Message-ID: <87ehtwt709.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Katzmann <peter.katzmann@edag.de> writes:

 Peter> Hello List,
 Peter> i' m evaluating the build with the new relase candidate and run into
 Peter> trouble with socat.
 Peter> When i enable the new dns faeture in uclibc socat build well but my
 Peter> asterisk build fails with problems.
 Peter> Build with uclibc-0.92.2 works well

Based on your attached uclibc config, it looks as if you're trying to
use a 0.9.32 config with 0.9.33, which won't work.

socat builds here without problems using the default 0.9.33 config.

-- 
Bye, Peter Korsgaard
