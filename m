From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Mar 2016 23:06:38 +0100
Subject: [Buildroot] [PATCH 1/3] configs: pandaboard: use mdev for
	automatic module loading
In-Reply-To: <1458077996-15549-1-git-send-email-peter@korsgaard.com> (Peter
 Korsgaard's message of "Tue, 15 Mar 2016 22:39:54 +0100")
References: <1458077996-15549-1-git-send-email-peter@korsgaard.com>
Message-ID: <87twk775w1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > The omap2plus kernel defconfig builds most drivers as modules, so we need
 > (automatic) module loading to be able to use usb/display/..

Committed all 3, thanks.

-- 
Venlig hilsen,
Peter Korsgaard 
