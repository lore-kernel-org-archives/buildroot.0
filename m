From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Nov 2014 23:23:13 +0100
Subject: [Buildroot] [PATCH] package/mutt: do not run compiled programs
	from ./configure
In-Reply-To: <1416175731-31022-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sun, 16 Nov 2014 23:08:51 +0100")
References: <1416175731-31022-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87ppcmdbu6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > mutt's ./configure is broken for cross-compilation, because it runs
 > programs to check for some features or behaviours.

 > So, we have to feed it some variables to force the checks the way they
 > are supposed to be resolved for our use-case.

 > Fixes:
 >     http://autobuild.buildroot.net/results/58c/58c73e72e1387c7f490ad97a86666b12393917cf/
 >     http://autobuild.buildroot.net/results/73b/73b8c54ca41cc475594c24a8d6176d511dcb85e6/

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
