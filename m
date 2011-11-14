From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 14 Nov 2011 13:12:26 +0100
Subject: [Buildroot] [git commit] libxcb: don't build doxygen
	documentation
In-Reply-To: <20111114120409.GB13389@sapphire.tkos.co.il> (Baruch Siach's
 message of "Mon, 14 Nov 2011 14:04:09 +0200")
References: <20111114114010.05E838E1B9@busybox.osuosl.org>
 <20111114120409.GB13389@sapphire.tkos.co.il>
Message-ID: <87hb26oqc5.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

Hi,

 >> +HOST_LIBXCB_CONF_OPT = --disable-build-docs
 >> 
 >> HOST_LIBXCB_DEPENDENCIES = \
 >> host-libxslt host-pthread-stubs host-xcb-proto host-xlib_libXdmcp \
 >> host-xlib_libXau host-python
 >> 
 >> +HOST_LIBXCB_CONF_OPT = --disable-build-docs

 Baruch> Do we really need this line twice?

Argh, cutnpaste issue - The first was supposed to be for the target,
naturally. Those two need to be specified explicitly.

Will fix.

-- 
Bye, Peter Korsgaard
