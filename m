From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Sep 2019 23:14:41 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/uclibc: fix termios
 redefinition issue for PowerPC
In-Reply-To: <20190908072959.2526-1-vadim4j@gmail.com> (Vadim Kochan's message
 of "Sun, 8 Sep 2019 10:29:59 +0300")
References: <20190908072959.2526-1-vadim4j@gmail.com>
Message-ID: <87o8z884e6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vadim" == Vadim Kochan <vadim4j@gmail.com> writes:

 > Fix redefinition of 'struct termios' by syncing termios powerpc headers
 > from glibc, the commit which fixed the same issue in glibc:

 >     d4795e4a43e6f0c221bc5dc64c612206a21a177b PowerPC: Fix termios definitions

 >     https://sourceware.org/git/?p=glibc.git;a=commit;h=d4795e4a43e6f0c221bc5dc64c612206a21a177b

 > it fixed the following bug request:

 >     https://bugzilla.redhat.com/show_bug.cgi?id=1122714

 > In case of Buildroot it fixes flashrom build for PowerPC.

 > Fixes:
 > 	http://autobuild.buildroot.net/results/797dde5cbf0e94162c7cc7b557841605c78ac2f3/

 > Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
 > ---

Committed to 2019.02.x, 2019.05.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
