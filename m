From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 13 May 2015 10:12:08 +0200
Subject: [Buildroot] [PATCH 1/1] package/mmc-utils: bump to latest commit
In-Reply-To: <1431429559-31351-1-git-send-email-sebastien.szymanski@armadeus.com>
 (=?utf-8?Q?=22S=C3=A9bastien?= Szymanski"'s message of "Tue, 12 May 2015
 13:19:19 +0200")
References: <1431429559-31351-1-git-send-email-sebastien.szymanski@armadeus.com>
Message-ID: <87617wgalj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "S?bastien" == S?bastien Szymanski <sebastien.szymanski@armadeus.com> writes:

 > The changes are:
 > d0b4644 mmc-utils: add ability to enable/disable optional eMMC cache
 > 64c2de8 mmc-utils: Add command to set the boot bus conditions
 > 7891236 mmc-utils: add support to create gp partition
 > 4afc8c8 mmc-utils: add check for max enhanced user area
 > 50b6854 fix building errors on Android
 > f4eb241 Fit usage to 80 cols
 > c6cb053 mmc-utils: RPMB: add support for 4 rpmb operations
 > 35c31fe mmc-utils: RPMB: add HMAC SHA256 support
 > a8276f5 fix make handling

 > Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
