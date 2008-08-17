From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 17 Aug 2008 14:36:09 +0200
Subject: [Buildroot] [PATCH] speex: convert to Makefile.autotools.in and
	bump version to 1.2rc1
In-Reply-To: <48A80032.6000106@yahoo.fr> (Malek's message of "Sun\,
	17 Aug 2008 10\:40\:50 +0000")
References: <48A80032.6000106@yahoo.fr>
Message-ID: <87k5efes3q.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Malek" == Malek  <souf_oued@yahoo.fr> writes:

 Malek> This patch converts speex to use Makefile.autotools.in and bump the
 Malek> version to 1.2rc1

Thanks. Your patch was word wrapped and listed twice, but I fixed it
up.

The target install doesn't strip the libs/programs - I'll fix that up.

-- 
Bye, Peter Korsgaard
