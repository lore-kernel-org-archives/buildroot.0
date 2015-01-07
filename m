From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 07 Jan 2015 15:57:33 +0100
Subject: [Buildroot] [PATCH] libevent: security bump to version 2.0.22
In-Reply-To: <1420641811-22334-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 7 Jan 2015 11:43:31 -0300")
References: <1420641811-22334-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87lhleocyq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes CVE-2014-6272 - integer overflow bugs in evbuffer_add() and
 > related functions.

 > Also file hash file (was stale) and switch to sourceforge for a
 > stable/proper hash.

 > Patch 0002-Avoid-using-top_srcdir-in-TESTS.patch is upstream so remove.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
