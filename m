From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 28 Feb 2012 21:34:18 +0100
Subject: [Buildroot] [PATCH 2/4] libglib2: update to version 2.30.2
In-Reply-To: <1330436399.2274.39.camel@sven> (Sven Neumann's message of "Tue, 
 28 Feb 2012 14:39:59 +0100")
References: <1330346337-27342-1-git-send-email-s.neumann@raumfeld.com>
 <1330346337-27342-3-git-send-email-s.neumann@raumfeld.com>
 <87aa433l77.fsf@macbook.be.48ers.dk> <1330436399.2274.39.camel@sven>
Message-ID: <87fwduelyt.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

Hi,

 Sven> So in the end what is tested is the value of glib_cv_have_qsort_r. With
 Sven> your fix this is now set even though uclibc does not provide qsort_r.

It does, but only from 0.9.33 and onwards. Sorry, didn't notice that it
was relatively new. Will fix.

-- 
Bye, Peter Korsgaard
