From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 22:57:31 +0200
Subject: [Buildroot] [PATCH] package/glibc: security bump for additional
 post-2.31.x fixes
In-Reply-To: <20200828200859.30129-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 28 Aug 2020 22:08:59 +0200")
References: <20200828200859.30129-1-peter@korsgaard.com>
Message-ID: <87k0xilc90.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issue:
 >   CVE-2016-10228: An infinite loop has been fixed in the iconv program when
 >   invoked with the -c option and when processing invalid multi-byte input
 >   sequences.  Reported by Jan Engelhardt.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
