From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 Aug 2019 21:52:09 +0200
Subject: [Buildroot] [PATCH] configs/roseapplepi_defconfig: use gcc 7.x
In-Reply-To: <20190828204635.20304-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 28 Aug 2019 22:46:35 +0200")
References: <20190828204635.20304-1-peter@korsgaard.com>
Message-ID: <87imqflpg6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > The old 3.10.x based vendor kernel does not build correctly with gcc 8.x.
 > While there is basic s500 support in the mainline kernel, there is not yet a
 > mmc driver so it isn't quite a replacement yet.

 > Stick to the vender kernel for now and revert back to gcc 7.x, hopefully
 > mainline support will be more complete once gcc 7.x gets dropped.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
