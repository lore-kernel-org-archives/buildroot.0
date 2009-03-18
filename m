From: Per-Henrik Lundblom <ph@whatever.nu>
Date: Wed, 18 Mar 2009 14:09:22 +0100
Subject: [Buildroot] Tool building problem EABI+PXA270
In-Reply-To: <1237379486.6302.2.camel@sven>
References: <20090318112308.GA27893@whatever.nu>
	<20090318114711.GA19956@buzzloop.caiaq.de>
	<20090318122515.GB27893@whatever.nu> <1237379486.6302.2.camel@sven>
Message-ID: <20090318130922.GC27893@whatever.nu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* Sven Neumann <s.neumann@phase-zero.de> [090318 13:31]:

> > ...using these settings I get this result. It is a result of using
> > iwmxxt target because I got the same error when I tried different
> > combinations of xscale/iwmmxt.
> 
> Did you really do a completely new build in a fresh tree? My experience
> with buildroot is that you can't change such fundamental changes to the
> configuration and expect make to succeed in the same tree, not even
> after 'make clean'.

I have noticed that so I checked out a fresh SVN version. So, the answer
is yes, fresh tree.

/PH

--
Per-Henrik Lundblom           epost: ph at whatever.nu
telefon: 0733-20 71 26        hemsida: www.whatever.nu
