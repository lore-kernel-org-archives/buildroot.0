From: Paul Cercueil <paul@crapouillou.net>
Date: Tue, 21 Oct 2014 00:24:12 +0200
Subject: [Buildroot] [PATCH 2/2 v5] package/mono: new package
Message-ID: <54458B8C.4020505@crapouillou.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In-Reply-To: 1413814528-26904-3-git-send-email-angelo.compagnucci at gmail.com

Hi Angelo,

Your package does not work here, host-mono fails to build.
I attached the log file.

Could the DLL files be downloaded instead of rebuilt? They should be
arch-independent, so it may be easier and faster to just download them.
Then only the runtime would need to be built.

Regards,

Paul

-------------- next part --------------
A non-text attachment was scrubbed...
Name: mono.log
Type: text/x-log
Size: 30232 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141021/06b14610/attachment-0001.bin>
