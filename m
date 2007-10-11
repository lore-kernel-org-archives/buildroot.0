From: Sushi Sensei <sinestado@gmail.com>
Date: Thu, 11 Oct 2007 10:59:41 -0300
Subject: [Buildroot] lockfile-progs update and patch
Message-ID: <a63ecaf0710110659l4acf370rd12bb151257f4a96@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

lockfile-progs 0.1.10 breaks with this error:

undefined reference to `*rindex*'

This patch update the package to 0.1.11 and add this patch.

The lockfile-progs-0.1.11.patch must be in package/lockfile-progs/

I'dont know how to make only one patch to add the two things.


-- 
------------------------------------------------------
--- Timeo Danaos et dona ferentes ---
------------------------------------------------------
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20071011/c8fe99f1/attachment.htm 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: br2-lockfile-progs.patch
Type: text/x-patch
Size: 1252 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20071011/c8fe99f1/attachment.bin 
