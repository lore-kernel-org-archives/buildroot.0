From: Allan W. Nielsen <a@awn.dk>
Date: Wed,  6 Apr 2011 12:03:14 +0200
Subject: [Buildroot] Upgrade of the Xorg-server to newest version
Message-ID: <1302084257-30775-1-git-send-email-a@awn.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series upgrades the XorgServer and all the xlibs + xprotos to newest
version. For test purposes I have also upgraded the ATI driver to its newest
version, it might be necessary to upgrade the remaining part of the x drivers.
To solve compilation errors it was necessary to upgrade the udev daemon, here I
have chosen version 151 (newest version is 167). The only reason for this
is that 151 is the default version on my system, and therefor I knew this
version could play well together with the remaining components.

This is my first patch for buildroot, so there is properly some bugs and other
problems... Therefore I will be happy to receive some comments.

Best regards
Allan W. Nielsen
