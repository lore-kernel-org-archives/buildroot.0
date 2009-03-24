From: Per-Henrik Lundblom <ph@whatever.nu>
Date: Tue, 24 Mar 2009 13:37:10 +0100
Subject: [Buildroot] Tool building problem EABI+PXA270
In-Reply-To: <20090319083953.GE30293@buzzloop.caiaq.de>
References: <20090318112308.GA27893@whatever.nu>
	<20090318114711.GA19956@buzzloop.caiaq.de>
	<20090318122515.GB27893@whatever.nu>
	<20090318123004.GE18723@buzzloop.caiaq.de>
	<20090318131349.GD27893@whatever.nu>
	<20090318132530.GF18723@buzzloop.caiaq.de>
	<20090318142514.GE27893@whatever.nu>
	<20090318144657.GC19956@buzzloop.caiaq.de>
	<20090318155323.GG27893@whatever.nu>
	<20090319083953.GE30293@buzzloop.caiaq.de>
Message-ID: <20090324123710.GW27893@whatever.nu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* Daniel Mack <daniel@caiaq.de> [090319 09:40]:
 
> I attached my config - if that works, you can diff it against your local
> one to find the root cause.

Thanks for that one! Of course I found some small discrepances between
your config and mine. I merged the two configs and everything built OK.
Unfortunately my board don't wan't to boot the resulting kernel. It
unpacks OK, then I don't get any more output on the console and the
system doesn't come up. Guess I have to leave the EABI for now even
though I really want to have it working.

/PH

--
Per-Henrik Lundblom           epost: ph at whatever.nu
telefon: 0733-20 71 26        hemsida: www.whatever.nu
