From: Sven Klomp <mail@klomp.eu>
Date: Thu, 26 Nov 2020 11:03:00 +0100
Subject: [Buildroot] Add crontab entries from package
Message-ID: <92cb0f53-5289-afec-91e7-fc5e93bf29d2@klomp.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I want to add entries to /etc/crontabs/root.
I know I can add abritary scripts to |BR2_ROOTFS_POST_BUILD_SCRIPT| to 
change files. However, as the crontab entry depends on the package, I 
want to change the file from within thepackage and not globally. How is 
this possible?
The documentation of |BR2_ROOTFS_POST_BUILD_SCRIPT |makes me think there 
must be another solution:
"You should, however, use this feature with care. Whenever you find that 
a certain package generates wrong or unneeded files, you should fix that 
package rather than work around it with some post-build cleanup scripts."


Thanks
Sven
||
