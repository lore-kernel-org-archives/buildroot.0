From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 26 Aug 2009 22:44:34 +0200
Subject: [Buildroot] Kernel panic - not syncing: Attempted to kill init!
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE190901C55435@mi8nycmail19.Mi8.com>
	(H. Hartley Sweeten's message of "Wed\,
	26 Aug 2009 12\:45\:05 -0400")
References: <BD79186B4FD85F4B8E60E381CAEE190901BEA738@mi8nycmail19.Mi8.com>
	<20090822011906.2dd045fc@surf>
	<BD79186B4FD85F4B8E60E381CAEE19091E7909@mi8nycmail19.Mi8.com>
	<20090822105505.27ace9b6@surf>
	<BD79186B4FD85F4B8E60E381CAEE190901BEA86D@mi8nycmail19.Mi8.com>
	<20090823081702.445b1b5a@surf>
	<BD79186B4FD85F4B8E60E381CAEE190901C550E7@mi8nycmail19.Mi8.com>
	<BD79186B4FD85F4B8E60E381CAEE190901C55101@mi8nycmail19.Mi8.com>
	<BD79186B4FD85F4B8E60E381CAEE190901C551E6@mi8nycmail19.Mi8.com>
	<BD79186B4FD85F4B8E60E381CAEE190901C552DE@mi8nycmail19.Mi8.com>
	<20090825190153.GA29206@mx.loc>
	<BD79186B4FD85F4B8E60E381CAEE190901C55435@mi8nycmail19.Mi8.com>
Message-ID: <87fxbemhjh.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "H" == H Hartley Sweeten <hartleys@visionengravers.com> writes:

Hi,

 H> What I don't understand is why they need to be copied to $(STAGING_DIR)
 H> and then needing to re-direct the --sysroot to them.  The only comment
 H> about this in ext-tool.mk says:

I didn't write the external toolchain support, but I guess it's
because the individual packages wants to install their libraries /
headers, and it's a lot simpler (E.G. similar to the internal
toolchain) if everything is together in a single directory tree
instead of 2 trees.

-- 
Bye, Peter Korsgaard
