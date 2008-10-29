From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Wed, 29 Oct 2008 15:48:06 +0100
Subject: [Buildroot] LDFLAGS setting in buildroot
In-Reply-To: <C13DBBE85AD6974B85C118C35890CA5F13B20D977B@EU1RDCRDC1WX029.exi.nxp.com>
References: <20081028131817.GA3139@mx.loc> <20081028143538.5e9eda36@surf>
	<20081028134555.GB3139@mx.loc> <20081028150833.015999ca@surf>
	<20081028153100.GC3139@mx.loc> <20081028170050.6ded5cda@surf>
	<20081028161325.GA5827@mx.loc>
	<C13DBBE85AD6974B85C118C35890CA5F13B20D9424@EU1RDCRDC1WX029.exi.nxp.com>
	<20081028171739.GC5827@mx.loc>
	<C13DBBE85AD6974B85C118C35890CA5F13B20D977B@EU1RDCRDC1WX029.exi.nxp.com>
Message-ID: <20081029144806.GE12067@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Oct 29, 2008 at 11:10:19AM +0100, Daniel J Laird wrote:
>I have been playing with using the AUTO_CONFIGURE_TARGET and it seems to be going faster as  you indicated but I have discovered an issue.

heh. I said "at least".
>
>I build a number of packages and as each one builds  they update the central cache file.
>However One of my packages configures before zlib is built.  

broken package. Fix it's dependencies.

>Do you see such issues as I cannot see how to make the cache file update with correct values after it has been told something does not exist.

This is strictly forbidden.
