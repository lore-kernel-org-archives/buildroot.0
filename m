From: Michael Feldman <mfeldman@Airspan.com>
Date: Tue, 30 Apr 2013 21:55:06 +0300
Subject: [Buildroot] Does MIP64 ABI 64 support dynamic linking?
Message-ID: <D4B053F823DA904C8FD129217ABE432D02E4B147C47B@fs28.airspan.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I built a buildroot MIPS64 BE rootfs for my XLP-based custom board (running currently an angstrom-based distribution built with gcc-4.4.5) using last version of buildroot.
The build procedure was quite smooth. However, when I tried to run the rootfs image (mounted on NFS), the system crashed immediately as linuxrc couldn't run.
I recompiled busybox as statically linked executable and replaced login in inittab to get directly into ash, without password. As result, I get the shell prompt and even succeed to run builtin commands of the shell, but as soon as I try to run any external command, even an applet of busybox, the shell crashes.
I haven't dug into the problem (and I don't have tools to do that, since it's impossible run any debug program on the board).

Has anybody faced this problem and has a hint how to solve it?

Thank you,
Michael

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130430/75ebd502/attachment.html>
