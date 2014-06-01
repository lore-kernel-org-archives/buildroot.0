From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 01 Jun 2014 22:18:59 +0200
Subject: [Buildroot] [PATCH v4 06/11] pkg-cmake.mk: globally disable
	BUILD_TESTING flag
In-Reply-To: <1401614673-3703-7-git-send-email-s.martin49@gmail.com> (Samuel
 Martin's message of "Sun, 1 Jun 2014 11:24:28 +0200")
References: <1401614673-3703-1-git-send-email-s.martin49@gmail.com>
 <1401614673-3703-7-git-send-email-s.martin49@gmail.com>
Message-ID: <87mwdw2xjg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 > This CMake flag is used to enable tests. It may not disable the test
 > programs from being built, but it controls the test execution.

 > Since we don't care about building the tests (and usually disable them
 > when possible), make sure Buildroot won't try to run them.

 > Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 > Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed, thanks.

-- 
Bye, Peter Korsgaard
