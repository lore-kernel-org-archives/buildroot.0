From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 19 Feb 2014 15:55:09 +0100
Subject: [Buildroot] [PATCH 1/3] mplayer: not available on bfin
In-Reply-To: <20140219110955.41b0c690@skate> (Thomas Petazzoni's message of
 "Wed, 19 Feb 2014 11:09:55 +0100")
References: <1392803602-5566-1-git-send-email-fabio.porcedda@gmail.com>
 <1392803602-5566-2-git-send-email-fabio.porcedda@gmail.com>
 <20140219110955.41b0c690@skate>
Message-ID: <87d2ij17aq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:


 > I believe it's time to switch to a different logic. What about:

 > config BR2_PACKAGE_MPLAYER_ARCH_SUPPORTS
 > 	bool
 > 	depends on <list of supported architectures>

I agree this would be a nice cleanup, but I've applied this series for
now for 2014.02.

-- 
Bye, Peter Korsgaard
