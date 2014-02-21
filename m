From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 22 Feb 2014 00:41:09 +0100
Subject: [Buildroot] [PATCH v3 1/1] ncftp: fix cross-compilation test
In-Reply-To: <1393016452-10812-1-git-send-email-romain.naour@openwide.fr>
 (Romain Naour's message of "Fri, 21 Feb 2014 22:00:52 +0100")
References: <1393016452-10812-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <87y514t4oa.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@openwide.fr> writes:

 > The cross-compilation test is based on the ability to run
 > a test program on the host, which is wrong.

 > If it runs, then the configure script concludes
 > that we're doing native compilation,
 > if it doesn't run, we're doing cross-compilation.

 > The configure script needs to be regenerated to fix the
 > cross-compilation test.

 > Fixes
 > http://autobuild.buildroot.net/results/969/969a49ae97a50634ea846a82b9c360e4fb020ace/build-end.log

 > Signed-off-by: Romain Naour <romain.naour@openwide.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
