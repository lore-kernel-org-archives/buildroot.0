From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 13 Mar 2012 14:17:36 +0100
Subject: [Buildroot] [PATCH] lua: fix non-shared library build
In-Reply-To: <1331475896-13161-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Sun, 11 Mar 2012 15:24:56 +0100")
References: <1331475896-13161-1-git-send-email-arnout@mind.be>
Message-ID: <87fwdcljwv.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 Arnout> Building without BR2_PACKAGE_LUA_SHARED_LIBRARY failed because of
 Arnout> missing -ldl.  dl is used by lua's dynamic module loading.

Committed, thanks.

-- 
Bye, Peter Korsgaard
