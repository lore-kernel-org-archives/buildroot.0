From: Adam McLaurin <buildroot@irotas.net>
Date: Fri, 31 Oct 2008 10:33:16 -0400
Subject: [Buildroot] How to build a gcc-3.3 toolchain
Message-ID: <1225463596.29685.1282290569@webmail.messagingengine.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi folks,

Unfortunately the software project I'm working on requires some features
of gcc that were removed after v3.3.x. However, when I do 'make
menuconfig' for buildroot and go to select the version of gcc, the only
versions available are 4.1.2, 4.2.1, 4.2.3, 4.2.4, and 4.3.1.

Is it possible to install an older version instead, perhaps 3.3.6?

Thanks,
Adam
