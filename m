From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Sun, 26 Jul 2009 11:45:43 +0200
Subject: [Buildroot] madplay broken?
Message-ID: <4A6C25C7.4040107@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

alsa-lib has a new API since version 1.0
madplay seems to require the older 0.9 API
which maybe still can be built using alsa-lib,
but it is not used in the current trunk.

Unless someone shows that madplay can be properly built,
I suggest we mark madplay as broken.


BR
Ulf Samuelsson
