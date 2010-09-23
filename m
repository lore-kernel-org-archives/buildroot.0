From: Marc Leclerc <marc-leclerc@signaturealpha.com>
Date: Thu, 23 Sep 2010 07:45:00 -0400
Subject: [Buildroot] e2fsck crashes
Message-ID: <4C9B3DBC.7040700@signaturealpha.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Hi,

Every attemps to include e2fsprogs on my target results in the utilities 
crashing with a segfault.

Sep 23 01:39:39 sa_linux user.info kernel: e2fsck[987]: segfault at 20 
ip b77316b8 sp bf968534 error 4
Sep 23 01:39:39 sa_linux user.info kernel:  in 
libuClibc-0.9.31.so[b7727000+43000]

Any idea why

Thanks
