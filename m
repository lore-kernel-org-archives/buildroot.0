From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 11 Dec 2013 22:20:01 +0100
Subject: [Buildroot] [PATCH] boost: fixup host variant dependencies
In-Reply-To: <1386684657-15391-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 10 Dec 2013 11:10:57 -0300")
References: <1386684657-15391-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <871u1j3x1a.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Define an empty HOST_BOOST_DEPENDENCIES to avoid inheriting
 > BOOST_DEPENDENCIES.
 > Also ditch redundant empty definitions for BOOST_DEPENDENCIES and
 > BOOST_FLAGS.

 > Fixes:
 > http://autobuild.buildroot.net/results/9c6/9c64dd473a8096bb6343d746544997e333053e8b/

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
