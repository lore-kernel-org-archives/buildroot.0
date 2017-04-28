From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Apr 2017 14:32:43 +0200
Subject: [Buildroot] [PATCH] icu: add upstream security fix for utf-8
	handling
In-Reply-To: <20170426125713.6427-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 26 Apr 2017 14:57:13 +0200")
References: <20170426125713.6427-1-peter@korsgaard.com>
Message-ID: <87pofwhfv8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes:
 > CVE-2017-7867 - International Components for Unicode (ICU) for C/C++ before
 > 2017-02-13 has an out-of-bounds write caused by a heap-based buffer overflow
 > related to the utf8TextAccess function in common/utext.cpp and the
 > utext_setNativeIndex* function.

 > CVE-2017-7868 - International Components for Unicode (ICU) for C/C++ before
 > 2017-02-13 has an out-of-bounds write caused by a heap-based buffer overflow
 > related to the utf8TextAccess function in common/utext.cpp and the
 > utext_moveIndex32* function.

 > Upstream: http://bugs.icu-project.org/trac/changeset/39671

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
