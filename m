From: Theo Debrouwere <theo.debrouwere@skynet.be>
Date: Wed,  7 Sep 2016 17:43:45 +0200
Subject: [Buildroot] [PATCH] package/php: explicitly disable phpdbg.
Message-ID: <1473263026-14588-1-git-send-email-theo.debrouwere@skynet.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I noticed that the php package now build & installs phpdbg.
In my setup, this is not necessary & even unwanted.

The patch disables building phpdbg.

Theo
