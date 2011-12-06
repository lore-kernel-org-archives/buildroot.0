From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 06 Dec 2011 11:58:11 +0100
Subject: [Buildroot] [PATCH] netsnmp: bump to 5.7.1 LTS
In-Reply-To: <ef682c5dfbfcc25c3eaec14233e080a5@zacarias.com.ar> (Gustavo
 Zacarias's message of "Tue, 06 Dec 2011 07:43:14 -0300")
References: <1323164603-5503-1-git-send-email-luca@lucaceresoli.net>
 <ef682c5dfbfcc25c3eaec14233e080a5@zacarias.com.ar>
Message-ID: <87pqg2q858.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> On 06.12.2011 06:43, Luca Ceresoli wrote:
 >> -NETSNMP_VERSION = 5.6.1.1
 >> +NETSNMP_VERSION = 5.7.1
 >> NETSNMP_SITE =
 >> 
 >> http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/net-snmp
 >> NETSNMP_SOURCE = net-snmp-$(NETSNMP_VERSION).tar.gz
 >> NETSNMP_INSTALL_STAGING = YES

 Gustavo> NAK.
 Gustavo> The 5.7 series (up to 5.7.1) fails miserably with a segfault on
 Gustavo> powerpc.

Uhh, that's bad. Any idea what's causing it?

I already committed the bump. I'll revert again if we cannot fix it.

-- 
Bye, Peter Korsgaard
