From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 15 May 2012 09:44:14 +0200
Subject: [Buildroot] [PATCH] gnutls: Fix search path for libgcrypt
In-Reply-To: <4FB1F75F.5050100@mind.be> (Arnout Vandecappelle's message of
 "Tue, 15 May 2012 08:27:43 +0200")
References: <1336847275-21899-1-git-send-email-arnout@mind.be>
 <20120512210755.672039a4@skate> <4FAEC2F4.1060802@mind.be>
 <87d3661soa.fsf@macbook.be.48ers.dk> <4FB1F75F.5050100@mind.be>
Message-ID: <871umlx50x.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 Arnout> This is BTW from one of the broken configs reported in the
 Arnout> autobuild, from which I also had to remove some more broken
 Arnout> packages (ltp-testsuite, ndisc6).  It's a generic powerpc
 Arnout> internal toolchain.

 >> ltp-testsuite is known to be broken with the default uClibc config,
 >> but I wasn't aware of any ndisc6 issues. What exactly goes wrong?

 Arnout>   It's a gettext issue. I haven't looked at it because I was
 Arnout> fixing something else, and because gettext anyway had patches
 Arnout> pending.

Thanks, fixed.

-- 
Bye, Peter Korsgaard
