From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 07 Feb 2013 17:07:13 +0100
Subject: [Buildroot] [PATCH] configs/{ea3250, fdi3250,
	phy3250}: lock down kernel headers version
In-Reply-To: <1360182113-23743-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 6 Feb 2013 17:21:53 -0300")
References: <1360182113-23743-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87y5f0kszy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Update {ea3250,fdi3250,phy3250}_defconfig to lock down kernel headers to
 Gustavo> an appropiate version.
 Gustavo> Otherwise the target is building with, at the moment of this writing,
 Gustavo> version 3.7 headers and a 2.6.34 kernel which usually isn't wise.

Committed, thanks.

-- 
Bye, Peter Korsgaard
