From: Clark Rawlins <clark.rawlins@escient.com>
Date: Fri, 08 Jan 2010 13:16:59 -0500
Subject: [Buildroot] Out of tree kernel modules
Message-ID: <1262974619.12983.12.camel@venture>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have a few out of tree kernel modules I want to add to buildroot, and
there doesn't seem to be a good place in the configuration hierarchy to
put them.  Would adding another category like buildroot already does for
editors called "Extra Kernel Modules" that list available
packages/modules.  These make fragments would then live in a separate
directory made for these packages called packages/kernel-modules.
