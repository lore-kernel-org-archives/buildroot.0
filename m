From: Julien Boibessot <julien.boibessot@free.fr>
Date: Thu, 19 Nov 2009 13:54:03 +0100
Subject: [Buildroot] Creating user accounts in rootfs
Message-ID: <4B053FEB.20104@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Does someone know a better way than the following to create user
accounts ? :
* on the target use "adduser xxx"
* then copy target's "/etc/passwd" and "/etc/shadow" to Host's
"buildroot/target/..../rootfs/target_skeleton/..."
* rebuild rootfs

My goal is to have a rootfs with preset user accounts, ready to be used
as soon as the rootfs image has been flashed.

Thanks
Julien
