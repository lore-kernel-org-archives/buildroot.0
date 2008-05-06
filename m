From: Mike Sander <msander@ripnet.com>
Date: Tue, 06 May 2008 14:39:44 -0400
Subject: [Buildroot] missing /proc in romfs
Message-ID: <4820A5F0.7030205@ripnet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

According to the buildroot docs the filesystem skeleton is available in 
/generic/target_skeleton.     The target_skeleton does include /proc.  
After I do a make, the project_build_arm/uclibc/root/ does NOT contain a 
/proc filesystem.  I'm not sure if other bits are missing. 

I have studied the output of the make process and have not been able to 
see where the basic filesystem is created.  I can see where specific 
bits are added to /etc /lib.   Could someone be so kind as to describe 
the initial steps in building the root filesystem  (and where 
target_skeleton fits in).   A brief list of the makefiles (and make 
targets) would be helpful.

Thanks in advance

Mike Sander
