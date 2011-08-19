From: Sam Nazarko <samnazarko@stmteam.com>
Date: Fri, 19 Aug 2011 22:53:57 +0100
Subject: [Buildroot] What happened to including toolchain in target?
Message-ID: <000501cc5eba$7f56ba60$7e042f20$@com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

 

In 2011.02x it is possible to include the toolchain on the target, but this
option is not visible in 2011.05. I would like to include the gclibc
toolchain as I need to do some external compiling. The only option I can
find that may be related is "Include development files in the target system"
which is enabled, but still ./configure fails at finding GCC.

 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110819/36ea5818/attachment.html>
