From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Mar 2012 22:46:59 +0100
Subject: [Buildroot] Applying Ludovic's patches
Message-ID: <20120314224659.23a5d71c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

Could you merge soon the patches that Ludovic Desroches from Atmel has
prepared? He has been working on this and posting regular versions of
this patch set since may 2011, so it's been a very long time, and both
Atmel and Armadeus need the capability of using a tarball of patches to
deliver patches for the Linux kernel or other components (U-Boot, etc.).

The time we have taken to react is really not a good invitation for
Ludovic or other developers from Atmel to contribute further to
Buildroot, and this is bit sad. I hope we can get this solved quickly
and get more contributions.

Here is the list of e-mails to apply:

Subject: [Buildroot] [PATCH 1/6] apply-patches.sh: check if there are rejects before applying patches
Date: Wed, 14 Mar 2012 16:33:52 +0100

Subject: [Buildroot] [PATCH 2/6] apply-patches.sh: rename targetdir to builddir
Date: Wed, 14 Mar 2012 16:33:53 +0100

Subject: [Buildroot] [PATCH 3/6] apply-patches.sh: cleanup
Date: Wed, 14 Mar 2012 16:33:54 +0100

Subject: [Buildroot] [PATCH 4/6] apply-patches.sh: directories are no more considered as overlays
Date: Wed, 14 Mar 2012 16:33:55 +0100

Subject: [Buildroot] [PATCH 5/6] apply-patches.sh: change archive management
Date: Wed, 14 Mar 2012 16:33:56 +0100

Subject: [Buildroot] [PATCH 5/6] apply-patches.sh: change archive management
Date: Wed, 14 Mar 2012 16:33:56 +0100

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
