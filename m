From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 31 Aug 2015 22:24:55 +0200
Subject: [Buildroot] [PATCH] exfat: fix build with musl
In-Reply-To: <1441012865-31350-1-git-send-email-peter@korsgaard.com> (Peter
 Korsgaard's message of "Mon, 31 Aug 2015 11:21:05 +0200")
References: <1441012865-31350-1-git-send-email-peter@korsgaard.com>
Message-ID: <878u8rryso.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes:
 > http://autobuild.buildroot.net/results/e1d/e1db07f0ea1e70c62f3294016c1b3a094de71d12/

 > The endianness handling functions in platform.h are protected behind ifdef
 > __GLIBC__ which musl doesn't define even though it does provide the
 > endianness handling interface.  Work around it by ensuring __GLIBC__ is
 > defined.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Venlig hilsen,
Peter Korsgaard 
