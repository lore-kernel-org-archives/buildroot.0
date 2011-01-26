From: Michael J. Hammel <buildroot@graphics-muse.org>
Date: Wed, 26 Jan 2011 14:03:07 -0700
Subject: [Buildroot] Migrate .05 to .08/.11 fails with glibc based
 external toolchain
In-Reply-To: <20110126203547.09906893@surf>
References: <1296063608.3969.20.camel@feynman.coloradoengineeringinc.com>
	<20110126203547.09906893@surf>
Message-ID: <1296075787.3969.22.camel@feynman.coloradoengineeringinc.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 2011-01-26 at 20:35 +0100, Thomas Petazzoni wrote:
> > make[1]: *** No rule to make target `uclibc_target', needed by
> > `gcc_target'. Stop.
> > make[1]: Leaving directory
> > `/home/mjhammel/src/cei/system_build/bld/buildroot-2010.11'
> > 
> You have enabled "native toolchain in the target filesystem" in
> Packages -> Development tools. This is not supported currently with
> external toolchains.

Ah.  Excellent.  That fixes it.  Many thanks!
-- 
Michael J. Hammel <buildroot@graphics-muse.org>
