From: Lars Dunemark <ladu@hms.se>
Date: Fri, 26 Apr 2013 06:10:08 +0000
Subject: [Buildroot] Adding local file system overlay
Message-ID: <6119D107D82B0940B389FAED3F2DDE6616222D57@Ansuz.hms.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Buildroot mailinglist!

During development of a new platform I sometimes find it useful to bundle my test builds with my own script/configuration files. 
Example: SSH keys

This is not something that we want to include in default configuration for a board or by any way get in a final build so instead I added a second step to local file system overlay checking a local variable and if it is set us it as a roofs overlay.

Is this something that is of interests for the upstream project?

Example: 
export  LOCAL_ROOTFS_OVERLAY=/local-rootfs-overlay
make

Best regards,
Lars Dunemark
