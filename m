From: Martin Banky <martin.banky@gmail.com>
Date: Mon, 20 Sep 2010 15:03:14 -0700
Subject: [Buildroot] [Review] Add gcc 4.5.1
Message-ID: <1285020197-30269-1-git-send-email-Martin.Banky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is the first pass at adding gcc 4.5.1 to buildroot. It builds fine for the
host and the target. The question I have, is the implementation the correct
way to change the toolchain? I couldn't find a lot of documentation regarding
the toolchain (as far as changing or updating it). Also, can the toolchain mk
files be updated to the new format or are their builds too complex?

[PATCH 1/3] dbus: bump to 1.4.0
[PATCH 2/3] m4: bump to 1.4.15
[PATCH 3/3] Added gcc 4.5.1 to buildroot
