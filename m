From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Jun 2018 23:17:07 +0200
Subject: [Buildroot] [git commit] libnss: backport upstream patch to fix
 build with gcc 8.x
In-Reply-To: <20180517203159.7ED998A455@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Thu, 17 May 2018 22:32:01 +0200")
References: <20180517203159.7ED998A455@busybox.osuosl.org>
Message-ID: <87po0x81m4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=45cf64ca0c0070151e4321e218e20cae5d730797
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > This commit backports upstream patch
 > https://github.com/nss-dev/nss/commit/f0ce70989526fc9a0223398c99ea0d09777ea5df
 > to our libnss package to fix the build with gcc 8.x.

 > Fixes:

 >   http://autobuild.buildroot.net/results/1ca35171200286fa032b24606aaa50de6a2d449e/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
