From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 05 Sep 2017 23:27:35 +0200
Subject: [Buildroot] [PATCH v1] bind: fix configure in case lmdb devel
	files are present on the host
In-Reply-To: <20170808165758.14788-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Tue, 8 Aug 2017 18:57:58 +0200")
References: <20170808165758.14788-1-ps.report@gmx.net>
Message-ID: <873780lttk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Fix configure failure in case lmdb devel files are present on the host
 > by adding --without-lmdb option (reported [1] and fix tested [2],[3] by
 > grunpferd at netscape.net).

 > Fixes:

 >   checking for lmdb library... yes
 >   checking for library containing mdb_env_create... no
 >   configure: error: found lmdb include but not library.

 > [1] http://lists.busybox.net/pipermail/buildroot/2017-August/199945.html
 > [2] http://lists.busybox.net/pipermail/buildroot/2017-August/199963.html
 > [3] http://lists.busybox.net/pipermail/buildroot/2017-August/199964.html

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
