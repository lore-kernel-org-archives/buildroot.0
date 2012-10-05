From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 05 Oct 2012 07:35:51 +0200
Subject: [Buildroot] [PATCH] strace: Version bump to 4.7
In-Reply-To: <87a9w20xrj.fsf@macbook.be.48ers.dk> (Peter Korsgaard's message
 of "Thu, 04 Oct 2012 22:48:16 +0200")
References: <1348821796-28798-1-git-send-email-markos.chandras@gmail.com>
 <87a9w20xrj.fsf@macbook.be.48ers.dk>
Message-ID: <87boghzdjc.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <jacmet@uclibc.org> writes:

>>>>>   <markos.chandras@gmail.com> writes:
 >> From: Markos Chandras <markos.chandras@imgtec.com>
 >> This also fixes a compilation problem with kernel headers 3.5
 >> http://autobuild.buildroot.net/results/bb66a3a06d26f558e1c4c0593bb68e7af1d82398/build-end.log

 Peter> Committed, thanks.

It unfortunately seems to be broken on largefile configurations:

http://autobuild.buildroot.net/results/db48ce61cdb53669958b8b301fd24d7ecc33b236/build-end.log

Any idea how to fix?

-- 
Bye, Peter Korsgaard
