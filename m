From: Daniel J Laird <daniel.j.laird@nxp.com>
Date: Tue, 28 Oct 2008 18:11:13 +0100
Subject: [Buildroot] LDFLAGS setting in buildroot
In-Reply-To: <20081028161325.GA5827@mx.loc>
References: <C13DBBE85AD6974B85C118C35890CA5F13B20D91B5@EU1RDCRDC1WX029.exi.nxp.com>
	<20081028131817.GA3139@mx.loc> <20081028143538.5e9eda36@surf>
	<20081028134555.GB3139@mx.loc> <20081028150833.015999ca@surf>
	<20081028153100.GC3139@mx.loc> <20081028170050.6ded5cda@surf>
	<20081028161325.GA5827@mx.loc>
Message-ID: <C13DBBE85AD6974B85C118C35890CA5F13B20D9424@EU1RDCRDC1WX029.exi.nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks for the link.  It looks like we want to start merging the AUTO_CONFIGURE_TARGET, the only downside at the moment is this is only used for Makefile.autotools.in stuff so I would need to do some changes to make it useful for directfb.mk for example.

I will have a look at the rest of these changes as well

Dan
