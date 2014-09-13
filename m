From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 13 Sep 2014 23:58:44 +0200
Subject: [Buildroot] [PATCH V3 1/4] ltrace: Removes the libelf dependency
In-Reply-To: <1409228494-19492-2-git-send-email-gregory.clement@free-electrons.com>
 (Gregory CLEMENT's message of "Thu, 28 Aug 2014 14:21:31 +0200")
References: <1409228494-19492-1-git-send-email-gregory.clement@free-electrons.com>
 <1409228494-19492-2-git-send-email-gregory.clement@free-electrons.com>
Message-ID: <87wq975giz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gregory" == Gregory CLEMENT <gregory.clement@free-electrons.com> writes:

 > The libelf is currently provided by 2 packages libelf and
 > elfutils. The first package provides an old version of the libelf
 > which is no more compatible with a recent version of ltrace. This
 > patch removes the dependency on the libelf package and only keep the
 > elfuils package which provides the accurate version of libelf for
 > ltrace.

 > It will also allow to remove the libelf package and to avoid conflicts
 > with two packages providing the same library.

 > Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
