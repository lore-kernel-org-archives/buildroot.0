From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 May 2018 16:29:37 +0200
Subject: [Buildroot] [PATCH] lynx: add patch to fix static link issue
In-Reply-To: <20180507200617.2527-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Mon, 7 May 2018 22:06:17 +0200")
References: <20180507200617.2527-1-thomas.petazzoni@bootlin.com>
Message-ID: <87in77x38u.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > The lynx package incorrectly uses target LDFLAGS to build a host tool,
 > which causes a problem when we do a statically link build for the
 > target, on a host machine that doesn't support static linking.

 > A simple patch fixes the problematic makefile, and it has been
 > submitted upstream on the project mailing list.

 > Fixes:

 >   http://autobuild.buildroot.net/results/38ba2531eeeb4a7985eddd2df8bfaf0b56e6a687/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
