From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Aug 2009 08:17:02 +0200
Subject: [Buildroot] Kernel panic - not syncing: Attempted to kill init!
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE190901BEA86D@mi8nycmail19.Mi8.com>
References: <BD79186B4FD85F4B8E60E381CAEE190901BEA43C@mi8nycmail19.Mi8.com>
	<20090819214237.534c433f@surf>
	<BD79186B4FD85F4B8E60E381CAEE190901BEA476@mi8nycmail19.Mi8.com>
	<20090819233037.1d8e5a5d@surf>
	<BD79186B4FD85F4B8E60E381CAEE190901BEA4AD@mi8nycmail19.Mi8.com>
	<20090820143514.7c5e56a2@surf>
	<BD79186B4FD85F4B8E60E381CAEE190901BEA58B@mi8nycmail19.Mi8.com>
	<BD79186B4FD85F4B8E60E381CAEE190901BEA5DB@mi8nycmail19.Mi8.com>
	<BD79186B4FD85F4B8E60E381CAEE190901BEA675@mi8nycmail19.Mi8.com>
	<20090821114447.188fc839@surf>
	<BD79186B4FD85F4B8E60E381CAEE190901BEA738@mi8nycmail19.Mi8.com>
	<20090822011906.2dd045fc@surf>
	<BD79186B4FD85F4B8E60E381CAEE19091E7909@mi8nycmail19.Mi8.com>
	<20090822105505.27ace9b6@surf>
	<BD79186B4FD85F4B8E60E381CAEE190901BEA86D@mi8nycmail19.Mi8.com>
Message-ID: <20090823081702.445b1b5a@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sat, 22 Aug 2009 18:53:34 -0400,
"H Hartley Sweeten" <hartleys@visionengravers.com> a ?crit :

> > Would you mind testing this new fix, and see if it works for you ?
> 
> No link?  Where can I get the fix to test?

Same place as the other fixes, in my multilib-toolchain-fix branch, at
http://git.buildroot.net/~tpetazzoni/git/buildroot/log/?h=multilib-toolchain-fix

The two commits are :
 http://git.buildroot.net/~tpetazzoni/git/buildroot/commit/?h=multilib-toolchain-fix&id=65ee9b3945a665f1279fa940b30818f4924acd31
 http://git.buildroot.net/~tpetazzoni/git/buildroot/commit/?h=multilib-toolchain-fix&id=2907415d82b7d306ca3f1f1ead0bbb0c7f1505c3

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
