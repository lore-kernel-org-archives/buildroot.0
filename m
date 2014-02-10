From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 10 Feb 2014 15:42:14 +0100
Subject: [Buildroot] [PATCH v3] libtorrent: disable on ARC arch
In-Reply-To: <1392041381-32699-1-git-send-email-anton.kolesov@synopsys.com>
 (Anton Kolesov's message of "Mon, 10 Feb 2014 18:09:41 +0400")
References: <20140210135318.4fc79cae@skate>
 <1392041381-32699-1-git-send-email-anton.kolesov@synopsys.com>
Message-ID: <87y51jyqpl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Anton" == Anton Kolesov <anton.kolesov@synopsys.com> writes:

 > Libtorrent has dependencies on atomic operations. However ARC GCC doesn't
 > implement those at the moment so package should be disabled. Rtorrent
 > depends on libtorrent.

 > This fixes:
 > http://autobuild.buildroot.net/results/51414e22c8ea47c38df20d864526a370c5a895d7/

 > Signed-off-by: Anton Kolesov <anton.kolesov@synopsys.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
