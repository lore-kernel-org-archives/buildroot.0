From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 14 Dec 2016 15:57:57 +0100
Subject: [Buildroot] [PATCH] configs/mx6sx_udoo_neo: Remove
	BR2_TARGET_GENERIC_GETTY_PORT
In-Reply-To: <1481725372-22010-1-git-send-email-fabio.estevam@nxp.com> (Fabio
 Estevam's message of "Wed, 14 Dec 2016 12:22:52 -0200")
References: <1481725372-22010-1-git-send-email-fabio.estevam@nxp.com>
Message-ID: <87eg1a1rt6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabio" == Fabio Estevam <fabio.estevam@nxp.com> writes:

 > As console=ttymxc0 is passed in U-Boot we can use /dev/console to
 > access the serial console and then BR2_TARGET_GENERIC_GETTY_PORT
 > can be removed.

 > Suggested-by: Peter Korsgaard <peter@korsgaard.com>
 > Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
