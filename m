From: MikeW <mw_phil@yahoo.co.uk>
Date: Thu, 9 Nov 2006 09:18:01 +0000 (UTC)
Subject: [Buildroot] Toolchain clean ? rebuild with extra patch
Message-ID: <loom.20061109T101231-410@post.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All of the toolchain-build contents persist after make clean, distclean,
so which 'clean' variant should be used if you want to rebuild the toolchain ?

(I would like to apply a toolchain patch, but the make system does not take
account of dependency on patchfiles, hence a clean rebuild seems to be the
way to do this)
