From: Roberto A. Foglietta <roberto.foglietta@gmail.com>
Date: Mon, 27 Oct 2008 11:09:40 +0100
Subject: [Buildroot] [PATCH] S00automnt + S90Xserver + profile.diff
Message-ID: <e4c675870810270309n313186c2r7d8cc63a80aab285@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi to all,

 please apply these changes if you think could be useful

 S00automnt:
 - find cdrom and mount it, if it exists
 - run over /proc/partitions and mount in ro all of them

 S90Xserver
 - prepare enviroment/initrc files
 - launch blackbox/twm/xterm over X
 - users compliant

 ^^^^ these two could be not executable in order to not run by default

 profile:
 - added /usr/X11R6/bin in PATH

 Bye,
-- 
/roberto
-------------- next part --------------
A non-text attachment was scrubbed...
Name: target_skeleton_generic.patch
Type: text/x-diff
Size: 10712 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20081027/0a884ec3/attachment-0001.patch 
