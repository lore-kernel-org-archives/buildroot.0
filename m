From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 02 Nov 2008 14:24:06 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/pciutils
In-Reply-To: <20081031124103.030FF3C7ED@busybox.net> (correa@uclibc.org's
	message of "Fri\, 31 Oct 2008 05\:41\:02 -0700 \(PDT\)")
References: <20081031124103.030FF3C7ED@busybox.net>
Message-ID: <87prle1csp.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "correa" == correa  <correa@uclibc.org> writes:

 correa> Author: correa
 correa> Date: 2008-10-31 05:41:02 -0700 (Fri, 31 Oct 2008)
 correa> New Revision: 23881

 correa> Log:
 correa> pciutils may depend on zlib. Based on Bernhard's git repository.

I personally don't find it worthwhile to do something like that for
such a standard/small library as zlib - But OK.

Buildroot is hard enough to test as it is, adding extra conditionals
to packages makes it worse - But OK.

-- 
Bye, Peter Korsgaard
