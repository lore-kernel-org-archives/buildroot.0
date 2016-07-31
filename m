From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 Jul 2016 23:23:49 +0200
Subject: [Buildroot] [PATCH] uclibc: add missing defines for
	m68k/microblaze
In-Reply-To: <20160731115709.GA9180@waldemar-brodkorb.de> (Waldemar Brodkorb's
 message of "Sun, 31 Jul 2016 13:57:10 +0200")
References: <20160731115709.GA9180@waldemar-brodkorb.de>
Message-ID: <8760rlqz6i.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

 > POLLRDHUP supported since Linux 2.6.17.
 > http://man7.org/linux/man-pages/man2/poll.2.html

 > Fixes:
 > http://autobuild.buildroot.net/results/0f5ed287f1756fbec710454e9c694202c3206dbe/
 > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Committed, thanks.

-- 
Bye, Peter Korsgaard
