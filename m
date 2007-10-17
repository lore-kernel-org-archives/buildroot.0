From: Ulf Samuelsson <ulf@atmel.com>
Date: Wed, 17 Oct 2007 07:01:45 +0200
Subject: [Buildroot] Matchbox compilation failure for Atmel ARM CPU.
References: <20071015020450.GA1526@cloud.net.au><20071017012240.GA27413@cloud.net.au>
	<406A31B117F2734987636D6CCC93EE3C02579F1D@ehost011-3.exch011.intermedia.net>
Message-ID: <002801c8107b$646fa7c0$01c4af0a@Glamdring>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Hi, Ulf:
>
> I have managed to create working filesystem for at91rm9200 based board,
> compiled by reasonably new buildroot of 9/24/2007. Minimal ramdisk is
> very small (~600K zipped, ~4M unzipped). There is some discrepancy in
> thttpd configuration, but this is peanuts.
>

Can you do a diff of your .config file for 9/24 and the latests svn.
Could be binutils-2.18 which generates the problem.

> Now I started to compile matchbox (X windows manager). It got
> successfully through all X11 stuff, but fails on libmatchbox itself:
>


Only enabled matchbox once, and this failed.
Never had time to look into it.

Best Regards
Ulf Samuelsson                ulf at atmel.com
Atmel Nordic AB
Mail:  Box 2033, 174 02 Sundbyberg, Sweden
Visit:  Kavalleriv?gen 24, 174 58 Sundbyberg, Sweden
Phone +46 (8) 441 54 22     Fax +46 (8) 441 54 29
GSM    +46 (706) 22 44 57
