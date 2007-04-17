From: Thomas Lundquist <lists@zelow.no>
Date: Tue, 17 Apr 2007 22:05:01 +0200
Subject: [Buildroot] which ipkg?
In-Reply-To: <20070417150722.GJ23570@aon.at>
References: <20070417101631.GA12039@zelow.no> <20070417111330.GB12656@zelow.no>
	<20070417150722.GJ23570@aon.at>
Message-ID: <20070417200501.GA25039@zelow.no>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Apr 17, 2007 at 05:07:22PM +0200, Bernhard Fischer wrote:
> 
> Ideally, we want ipkg in busybox, ultimately.

true enough. I was discusssed a few years ago but nothing happened.

Just checked and the ipkg shell script is 28K and ipkg-cl 2K but it
needs libpkg which is 134K.. 

but libipkg seems to have quite alot of libbb in it but I'm not sure how
much can be shaved off when putting it into busybox.

> I once looked at the
> normal ipkg for a few minutes, and from what i remember, providing
> a nice, working and small applet from it (by rewriting it) looked quite
> reasonable, fwiw.

I may some day try it but not before I need it or someone pays me.

Until then I'll use ipkt-utils (mainly ipkg-build and hopefully not
needing the python part of the utils.) for building the packages and let
the user choose between the shell script and ipkg-cl.

hopefully they are compatible enough. if not I'll do as OpenWRT seems to
have; choose the shell script.

(unless someone here tells me what to do.)



Thomas.
