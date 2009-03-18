From: Per-Henrik Lundblom <ph@whatever.nu>
Date: Wed, 18 Mar 2009 15:25:14 +0100
Subject: [Buildroot] Tool building problem EABI+PXA270
In-Reply-To: <20090318132530.GF18723@buzzloop.caiaq.de>
References: <20090318112308.GA27893@whatever.nu>
	<20090318114711.GA19956@buzzloop.caiaq.de>
	<20090318122515.GB27893@whatever.nu>
	<20090318123004.GE18723@buzzloop.caiaq.de>
	<20090318131349.GD27893@whatever.nu>
	<20090318132530.GF18723@buzzloop.caiaq.de>
Message-ID: <20090318142514.GE27893@whatever.nu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* Daniel Mack <daniel@caiaq.de> [090318 14:25]:

> > conftest.c:2: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'me'
> > configure:3636: $? = 1
> > configure: failed program was:
> > | #ifndef __cplusplus
> > |   choke me
> > | #endif
> 
> That's your problem - C++ support is not enabled. Could you try your
> build with 'BR2_INSTALL_LIBSTDCPP=y'? And as Sven suggested, clean your
> tree probably :)

Don't know how i could have missed the "choke me", i digged through the
condig.log pretty thoroughly... Nevermind, I get the same problem even
with BR2_INSTALL_LIBSTDCPP=y and a clean Buildroot install.

/PH

--
Per-Henrik Lundblom           epost: ph at whatever.nu
telefon: 0733-20 71 26        hemsida: www.whatever.nu
