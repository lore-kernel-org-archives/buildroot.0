From: mlweber1 at rockwellcollins.com <mlweber1@rockwellcollins.com>
Date: Thu, 24 Oct 2013 08:54:13 -0500
Subject: [Buildroot] RFC: make export-sysroot
Message-ID: <OF3447DAE1.89CC3270-ON86257C0E.004C5FFB@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm curious to see if there would be any traction to add a 'make export-sysroot' option that functions like the WindRiver workbench sysroot export.  We've been manually doing something like this where we tar up the output/host folder to distribute to other users.  Since we can't maintain the original output/host location (ran into symlink errors if we moved the host folder after it was built), we also provide the original toolchain archive.  This results in the user needing to use the --sysroot when they build (seems like an ok approach so far).

Thoughts?  Maybe I'm missing an approach to actually make use of the generated host folder toolchain outside of its original buildroot path...  Which would then simplify this to just a archiving of the output/host into a tarball placed in the images folder.

Thanks,
Matt Weber
mlweber1 at rockwellcollins.com
