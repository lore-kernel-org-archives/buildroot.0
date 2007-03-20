From: don <don_reid@comcast.net>
Date: Tue, 20 Mar 2007 12:04:21 -0700
Subject: [Buildroot] Error patching kernel for headers
Message-ID: <20070320190421.GA29210@reid1.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With current svn files, I get these errors.  It looks like there is a
problem with a patch file (linux-2.6.20.3-ipmisensors-20070314-1214.patch)
in the kernel-headers stuff.

----------
toolchain/patch-kernel.sh /home/don/Robots/Bot1/EPIA/buildroot/build_i486/linux-2.6.20.3 toolchain/kernel-headers \
		linux-2.6.20.3-\*.patch{,.gz,.bz2}

Applying linux-2.6.20.3-ipmisensors-20070314-1214.patch using plaintext: 
patching file drivers/char/ipmi/ipmi_msghandler.c
Reversed (or previously applied) patch detected!  Assume -R? [n] 
Apply anyway? [n] 
Skipping patch.
2 out of 2 hunks ignored -- saving rejects to file drivers/char/ipmi/ipmi_msghandler.c.rej
The next patch would create the file drivers/char/ipmi/ipmi_msghandler.c.orig,
which already exists!  Assume -R? [n] 
Apply anyway? [n] 
Skipping patch.
1 out of 1 hunk ignored -- saving rejects to file drivers/char/ipmi/ipmi_msghandler.c.orig.rej
patching file drivers/hwmon/Kconfig
Reversed (or previously applied) patch detected!  Assume -R? [n] 
Apply anyway? [n] 
Skipping patch.
1 out of 1 hunk ignored -- saving rejects to file drivers/hwmon/Kconfig.rej
patching file drivers/hwmon/Makefile
Reversed (or previously applied) patch detected!  Assume -R? [n] 
Apply anyway? [n] 
Skipping patch.
1 out of 1 hunk ignored -- saving rejects to file drivers/hwmon/Makefile.rej
The next patch would create the file drivers/hwmon/ipmisensors.c,
which already exists!  Assume -R? [n] 
Apply anyway? [n] 
Skipping patch.
1 out of 1 hunk ignored -- saving rejects to file drivers/hwmon/ipmisensors.c.rej
The next patch would create the file drivers/hwmon/ipmisensors.h,
which already exists!  Assume -R? [n] 
Apply anyway? [n] 
Skipping patch.
1 out of 1 hunk ignored -- saving rejects to file drivers/hwmon/ipmisensors.h.rej
patching file include/linux/ipmi.h
Reversed (or previously applied) patch detected!  Assume -R? [n] 
Apply anyway? [n] 
Skipping patch.
1 out of 1 hunk ignored -- saving rejects to file include/linux/ipmi.h.rej
patching file include/linux/ipmi_msgdefs.h
Reversed (or previously applied) patch detected!  Assume -R? [n] 
Apply anyway? [n] 
Skipping patch.
3 out of 3 hunks ignored -- saving rejects to file include/linux/ipmi_msgdefs.h.rej
Patch failed!  Please fix linux-2.6.20.3-ipmisensors-20070314-1214.patch!
make: *** [/home/don/Robots/Bot1/EPIA/buildroot/build_i486/linux-2.6.20.3/.patched] Error 1
