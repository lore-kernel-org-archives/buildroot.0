From: Darcy L. Watkins <dwatkins@tranzeo.com>
Date: Tue, 22 Jun 2010 07:16:24 -0700
Subject: [Buildroot] [May15 patch 12/12] netsnmp: disable build with
	external toolchain
Message-ID: <1277216184.23331.8.camel@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I need to be able to build net-snmp in my buildroot using a crosstool-ng
external toolchain.

Has anyone made progress or determined the underlying cause of why
net-snmp cannot properly locate the libraries even though --sysroot
points to the buildroot staging area (instead of using the toolchain
default)?

Would adding redundant -L<path> to the staging library area work (and
likely also -I<path> to the includes if needed)?

Any insight as to why this happens with net-snmp (or is it observed with
some other packages too)?

Regards,

Darcy
