From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 24 Jan 2009 12:50:41 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/scripts:  test
In-Reply-To: <20090124112911.51B4E769CC@busybox.osuosl.org> (ulf@uclibc.org's
	message of "Sat\, 24 Jan 2009 11\:29\:11 +0000 \(UTC\)")
References: <20090124112911.51B4E769CC@busybox.osuosl.org>
Message-ID: <8763k4hqi6.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ulf" == ulf  <ulf@uclibc.org> writes:

 ulf> Author: ulf
 ulf> Date: 2009-01-24 11:29:10 +0000 (Sat, 24 Jan 2009)
 ulf> New Revision: 25005

 ulf> Log:
 ulf> Add test configuration but do not include it by default

 ulf> Added:
 ulf>    trunk/buildroot/scripts/test/
 ulf>    trunk/buildroot/scripts/test/Config.in.test.buildall

Come on, just keep it locally instead if it isn't used by BR.

What does this buy you compared to just having a .config with those
things enabled?

Please discuss these things on the list first when you know they are
controversive.

-- 
Bye, Peter Korsgaard
