From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 12 Dec 2013 16:25:53 +0100
Subject: [Buildroot] [PATCH] uclibc: do not enable DODEBUG
In-Reply-To: <1386798981-17924-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 11 Dec 2013 22:56:21 +0100")
References: <1386798981-17924-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87wqja1472.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > The DODEBUG configuration option in uClibc is broken, even for widely
 > used architectures like ARM. Therefore, any Buildroot configuration
 > that has BR2_ENABLE_DEBUG enabled and uses uClibc with the internal
 > toolchain backend will fail, with an error like:

 >   http://autobuild.buildroot.net/results/d34/d34238c209cf2ef63371a598ab9218165c90f864/build-end.log

 > This error was also reported recently by a Buildroot user.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
