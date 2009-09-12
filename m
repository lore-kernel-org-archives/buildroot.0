From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 12 Sep 2009 08:02:10 +0200
Subject: [Buildroot] Kernel panic - not syncing: Attempted to kill init!
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE190901CBEF0C@mi8nycmail19.Mi8.com>
	(H. Hartley Sweeten's message of "Fri\,
	11 Sep 2009 18\:04\:44 -0400")
References: <BD79186B4FD85F4B8E60E381CAEE190901C551E6@mi8nycmail19.Mi8.com>
	<BD79186B4FD85F4B8E60E381CAEE190901C552DE@mi8nycmail19.Mi8.com>
	<20090825190153.GA29206@mx.loc>
	<BD79186B4FD85F4B8E60E381CAEE190901C55435@mi8nycmail19.Mi8.com>
	<87fxbemhjh.fsf@macbook.be.48ers.dk>
	<BD79186B4FD85F4B8E60E381CAEE190901C554E3@mi8nycmail19.Mi8.com>
	<20090827074957.GB19075@mx.loc>
	<BD79186B4FD85F4B8E60E381CAEE190901C558CA@mi8nycmail19.Mi8.com>
	<20090830110318.GD7953@mx.loc>
	<BD79186B4FD85F4B8E60E381CAEE190901CBED29@mi8nycmail19.Mi8.com>
	<20090911103438.GB29175@mx.loc>
	<BD79186B4FD85F4B8E60E381CAEE190901CBEF0C@mi8nycmail19.Mi8.com>
Message-ID: <874or8u2e5.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "H" == H Hartley Sweeten <hartleys@visionengravers.com> writes:

Hi,

 H> FWIW, my buildroot tree is 2009.11-git with some customization in
 H> target/device for my platform.  Everything else is straight from the
 H> git tree.

 H> Where is your tree located?  Is it pullable?

Bernhard forked buildroot several years ago, so the differences between
his tree and the official one is unfortunately quite big.

Hopefully we can get him to contribute to the official tree again, now
that atleast some of the issues leading to the fork have been / are
getting resolved.

His tree is at:

git://repo.or.cz/buildroot

-- 
Bye, Peter Korsgaard
