From: Elizabeth Oldham <beth@mips.com>
Date: Thu, 20 Sep 2007 22:38:52 +0100
Subject: [Buildroot] local mirror management (bug #572)
In-Reply-To: <20070919082107.GC11856@aon.at>
References: <20070917075500.052F2A4692@busybox.net>	<1190025802.8052.4.camel@elrond.sweden.atmel.com>	<20070917092735.GA18888@aon.at>	<1190031404.8052.9.camel@elrond.sweden.atmel.com>	<20070917111024.GB22104@aon.at>	<1190040978.8052.20.camel@elrond.sweden.atmel.com>	<20070917134117.GC24993@aon.at>	<1190098489.4064.7.camel@elrond.sweden.atmel.com>
	<20070919082107.GC11856@aon.at>
Message-ID: <46F2E86C.7050705@mips.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernhard Fischer wrote:

> "local mirror" patch in mantis (or the ML archives). See 1).
> With the patch mentioned above, you (i.e. the user) is free to setup and
> use any mirror she likes, be it the
> http://buildroot.uclibc.org/downloads/buildroot-sources/
> or another, potentially local directory (i.e. nothing you can talk to
> via http or ftp).
> 
> 1) http://bugs.busybox.net/view.php?id=572

I'll bite, this is exactly what I need... I tweaked the patch in that 
bug and attach my version for comment. I dont know what clean up you had 
in mind but I'm happy to make further attempts.

Beth
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: local-mirror.patch
Url: http://busybox.net/lists/buildroot/attachments/20070920/fd87a513/attachment.diff 
