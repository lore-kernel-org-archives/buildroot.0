From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 26 Sep 2013 21:00:35 +0200
Subject: [Buildroot] libgcc erroneously built as armv5 for
	arm920t(armv4t)
In-Reply-To: <20130926175405.67336473@skate> (Thomas Petazzoni's message of
 "Thu, 26 Sep 2013 17:54:05 +0200")
References: <1380209693.38971.YahooMailNeo@web162205.mail.bf1.yahoo.com>
 <20130926175405.67336473@skate>
Message-ID: <8761tn76i4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> Interesting. First, thanks for the investigation.

 Thomas> When you select BR2_arm920t as the ARM processor, we are
 Thomas> already passing --with-arch=armv4t to the gcc configure. So,
 Thomas> gcc should already avoid the use of CLZ, since ARMv4T does not
 Thomas> support it.

It indeed sounds quite strange, as I've run buildroot rootfs'es on the
mini2440 (which is arm920t) back in 2011 at least.

I don't have access to that hardware anymore though.

-- 
Bye, Peter Korsgaard
