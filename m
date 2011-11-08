From: Julian Lunz <git@jlunz.de>
Date: Tue, 8 Nov 2011 20:22:33 +0100
Subject: [Buildroot] Patch for x11r7 folder structure
Message-ID: <20111108202233.4cdfee8e@jl-desk-LL>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi.

I have a patch to reorganize the folder layout of x11r7 to reflect
the nice layout available in menuconfig.

Layout would change to be:

$ ls -F1 package/x11r7/
applications/
Config.in
drivers/
fonts/
libraries/
other/
protocols/
utils/
x11r7.mk
xserver_xorg-server/


I have already sent a patch, but as it is quite big (931231 bytes) it
needs approval, so in the meanwhile I'm curious for comments.

Julian
