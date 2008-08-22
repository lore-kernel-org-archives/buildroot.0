From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 22 Aug 2008 16:02:11 +0200
Subject: [Buildroot] [PATCH] fix keeping includes in
	Makefile.autotools.in
In-Reply-To: <1219347409.7367.22.camel@wberrierlx.appsig.com> (Wade Berrier's
	message of "Thu\, 21 Aug 2008 13\:36\:49 -0600")
References: <1219347409.7367.22.camel@wberrierlx.appsig.com>
Message-ID: <874p5d2lng.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Wade" == Wade Berrier <wberrier@gmail.com> writes:

 Wade> Hi,
 Wade> Makefile.autotools.in refers to an old configuration option:
 Wade> BR2_HAVE_INCLUDES.

Thanks, committed as r23179.

-- 
Bye, Peter Korsgaard
