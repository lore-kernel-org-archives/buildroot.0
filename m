From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 08 Nov 2010 10:48:26 +0100
Subject: [Buildroot] Buildroot 2010.11-rc1 released
Message-ID: <87tyjsywlx.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot 2010.11-rc1 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2010.11-rc1.tar.gz

or

http://buildroot.net/downloads/buildroot-2010.11-rc1.tar.bz2

Or get it from Git:

git://git.buildroot.net/buildroot

Please give it a spin and report any problems to the mailing list or bug
tracker. Many thanks to the people contributing to this release:

git shortlog -s -n 2010.08..
   138  Peter Korsgaard
   104  Thomas Petazzoni
    37  Martin Banky
    33  Gustavo Zacarias
    15  Lionel Landwerlin
    15  Yann E. MORIN
     8  Maxime Petazzoni
     8  Paulius Zaleckas
     3  Chih-Min Chao
     2  Mike Frysinger
     2  Yegor Yefremov
     1  Andy Gibbs
     1  Felipe Contreras
     1  Marcus Osdoba
     1  Paul Burton
     1  Paul Jones

And especially thanks to Martin Banky for lots of AUTOTARGET/GENTARGET
conversions. We're now only missing around 50 packages. This
conversion isn't only important to ensure package consistency and ease
maintenance, but it is also an enabled for new features like package
handling as discussed during the recent Buildroot developer day in
Cambridge, UK.

Of noteworthy new features we have:
 - Updated kconfig infrastructure with 'nconfig' and 'savedefconfig'
   support
 - Experimental crosstool-ng toolchain backend and GCC 4.5.x support
 - Generalized download handling and GIT/SVN support

Also notice that we've removed Alpha, Cris, IA64 and Sparc64
architecture support as announched in the 2010.08 release notes.

For more details, see the CHANGES file:

http://git.buildroot.net/buildroot/plain/CHANGES?id=2010.11_rc1

Enjoy!

-- 
Bye, Peter Korsgaard
