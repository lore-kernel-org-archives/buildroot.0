From: Sushi Sensei <sinestado@gmail.com>
Date: Fri, 12 Oct 2007 09:49:41 -0300
Subject: [Buildroot] lockfile-progs Don't compile!! Update and Patch
Message-ID: <a63ecaf0710120549j6caab08bke72fd4f3d2463e7c@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

lockfile-progs 0.1.10 breaks with this error:

undefined reference to `*rindex*'

This patch update the package to 0.1.11 and add a patch to solve this.


PD: now added the patch file into general patch :-)
-- 
------------------------------------------------------
--- Timeo Danaos et dona ferentes ---
------------------------------------------------------
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20071012/a185d65a/attachment-0001.htm 
