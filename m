From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 19 Jun 2008 21:06:59 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/config
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE19091D654B@mi8nycmail19.Mi8.com>
	(hartleys@visionengravers.com's message of "Thu\,
	19 Jun 2008 12\:44\:59 -0400")
References: <20080619081151.B9E73F8008@busybox.net>
	<BD79186B4FD85F4B8E60E381CAEE19091D654B@mi8nycmail19.Mi8.com>
Message-ID: <87k5glfdm4.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "hartleys" == hartleys  <hartleys@visionengravers.com> writes:

Hi,

 hartleys> Hello all,

 hartleys> I just did an svn up for the latest revision of buildroot
 hartleys> (22451). It appears something is either broke or I'm
 hartleys> missing something.

Sorry, my fault - I seems like I didn't get package/config cleaned up
correctly before committing the kbuild updates, so I didn't see the
problem.

There were two issues: check.sh was missing and the new kbuild is
stricter, so I had to fixup depends BLAH -> depends on BLAH.

It should be fixed from r22455 on (remember to clean your
package/config directory).

-- 
Bye, Peter Korsgaard
