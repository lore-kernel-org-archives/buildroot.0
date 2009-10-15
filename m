From: Mark Jackson <mpfj-list@mimc.co.uk>
Date: Thu, 15 Oct 2009 10:38:17 +0100
Subject: [Buildroot] Missing 'make install' option ?
Message-ID: <4AD6ED89.6020902@mimc.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Correct me if I'm missing something here ...

After I've run a successful build the output/target directory contains
a copy of the target files.  Fine.

If I then, say, remove a package via 'make menuconfig', I have to then
perform a 'make dirclean; make' to generate a new set of target files.

This, of course, causes a re-compile of *everything* !!

Is this right ?  Seems a bit of overkill to blow away everything you've
just compiled, simply to remove some unwanted files.

Is there not a sort of 'make' option that:-

(a) deletes the output/target
(b) compiles any new packages added since the last build
(c) generates a new output/target tree

?

Thanks
Mark
