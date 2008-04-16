From: Igor Tseglevskiy <igor.tseglevskiy@gmail.com>
Date: Wed, 16 Apr 2008 15:56:29 +0400
Subject: [Buildroot] user shell exits immediately after start.
Message-ID: <443458e80804160456u7861da33pc17f717e9b90a925@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Folks, I need your help.

I have buildroot on arm9 device. System loads correctly, starts
intetd, shows login prompt on serial console. User default has no
assword. System checks login and starts /bin/sh (I now it because I
inserted some debug prints in shell source). But shell after it exits
immediately without any messages in log and on console. Behavior is
identical on console and via telnet. Do you have ideas?

Igor Tseglevskiy
