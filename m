From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Sep 2016 20:16:54 +0200
Subject: [Buildroot] [PATCH] transmission: fix compile error
In-Reply-To: <20160929181259.GA16185@waldemar-brodkorb.de> (Waldemar
 Brodkorb's message of "Thu, 29 Sep 2016 20:12:59 +0200")
References: <20160929181259.GA16185@waldemar-brodkorb.de>
Message-ID: <874m4xtfqh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

 > After update to uClibc-ng 1.0.18 transmission fails to
 > compile as the special treatment for sys/quota.h isn't required
 > anymore, because upstream synced with GNU libc to fix a samba4
 > compile problem.

 > Signed-off-by: Waldemar Brodkorb <wbx@uclibc-ng.org>

Committed, thanks. Don't forget to submit the patch upstream.

-- 
Bye, Peter Korsgaard
