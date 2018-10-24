From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Oct 2018 13:57:06 +0200
Subject: [Buildroot] [git commit] boot/uboot: fix environment image
 generation on big endian systems
In-Reply-To: <20181014191221.E12D083744@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Sun, 14 Oct 2018 21:11:58 +0200")
References: <20181014191221.E12D083744@busybox.osuosl.org>
Message-ID: <87in1rblrh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=d6fcf044a747284df4eddaf106082ebb571976b3
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > As reported by Jeff Wittrock in bug #11396, the U-Boot environment
 > image checksum is invalid for big endian targets, because the test on
 > the BR2_ENDIAN Config.in option doesn't take into account that it is
 > double quoted.

 > The fix was provided by Jeff himself on bugzilla.

 > Fixes bug #11396.

 > Reported-by: Jeff Wittrock <jwittrock@faultrecorder.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.02.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
