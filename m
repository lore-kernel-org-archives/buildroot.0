From: John OSullivan <john.osullivan@cloudiumsystems.com>
Date: Wed, 13 May 2015 17:40:31 +0100
Subject: [Buildroot] Generating Debug Info Files
Message-ID: <00b501d08d9b$87eae570$97c0b050$@osullivan@cloudiumsystems.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

When I run perf on my buildroot based system it complains about missing
symbols for my libraries and applications. I know it is possible to generate
binaries with symbolic information in the staging area by selecting 'build
packages with debugging symbols', but is there any way of generating
separate .debug type files or do I need to do this in postBuild with a
script based on objcopy.

 

Regards

John

 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150513/dc056904/attachment.html>
