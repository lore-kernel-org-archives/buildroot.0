From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Jul 2015 08:16:51 +0200
Subject: [Buildroot] snmpd
In-Reply-To: <944894A3EB1D044A9003B2F944389BB20474AD8BCB@svr-wa-exch1.atg.lc>
References: <944894A3EB1D044A9003B2F944389BB20474AD8BCB@svr-wa-exch1.atg.lc>
Message-ID: <20150722081651.50be78ec@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tommy,

On Tue, 21 Jul 2015 17:20:40 -0700, Lee, Tommy wrote:

> I have a Marvell ARMADA A38x evaluation board (DB-88F6820-GP) running
> the Buildroot 2012.11-00023-gae0d9a2-dirty release on it. I have
> brought it up on an Ethernet segment. My next work is to enable an
> SNMP agent which can response the SNMPv1 requests from an SNMP client
> which is running in an Ububtu PC.

First and foremost, you should use a more recent Buildroot version.
Buildroot 2012.11 is really old, and you won't get much support for
this mailing list for a 3 years old Buildroot version, I'm afraid.

I guess you're using this Buildroot version specifically because it was
given to you by Marvell. However, nothing forces you to use exactly the
Buildroot provided by Marvell. You can use the official Buildroot with
no problem. I do use the latest Buildroot to build a rootfs for my
Armada 38x developments :)

> I hope you would tell me how to create the agent and install it on
> the Buildroot board. I will be very much appreciated.

Well, just enable the netsnmp package, and that should be pretty much
it. Maybe you'll need to adjust a few configuration files of snmpd.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
