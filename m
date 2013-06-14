From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Fri, 14 Jun 2013 12:02:44 +0200
Subject: [Buildroot] Kernel download problem.
Message-ID: <25A17A429F5A404F8323F087DD6980C4@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 
 Hi

There seems to be a problem with the downloading of a kernel when a longterm release is selected.

Buildroot tries 

http://www.kernel.org/pub//linux/kernel/v2.6/linux-2.6.34.14.tar.xz 

While the real kernel is at 
https://www.kernel.org/pub/linux/kernel/v2.6/longterm/v2.6.34/linux-2.6.34.14.tar.xz

So maybe it should be copied to the buildroot sources mirror.

 
Regards Sagaert Johan
