From: Darcy L. Watkins <dwatkins@tranzeo.com>
Date: Tue, 06 Jul 2010 10:08:13 -0700
Subject: [Buildroot] Deprecate rp-pppoe package
Message-ID: <1278436093.12234.11.camel@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Before you remove the rp-pppoe package from buildroot, I have a
question.  Does the pppoe plugin for pppd include the access
concentrator (AC) support in it as well?

I ask this because most people only care about the client side and don't
think much about the server side you connect it to.

A while back, I cross compiled the AC functionality of rp-pppoe on
powerpc, added a freeradius client and demo'd a simple embedded AC on an
AMCC Taihu involving, a private LAN, freeradius running on a server
machine and a windows PC running its PPPoE client.  I was able to
advertise numerous "services" from the Taihu and have the PC be able to
select and connect to them using PPPoE sessions.

Regards,

Darcy
