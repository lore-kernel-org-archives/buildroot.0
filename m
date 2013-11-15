From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Fri, 15 Nov 2013 20:38:13 +0100
Subject: [Buildroot] UpnpInit2 failure with IPv6 enabled  : SOLVED
Message-ID: <62953FA3A00B43BCB4131464F6FCA806@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 
Hi ;

Problem solved, trivial : IPv6 was just not enabled in the kernel configuration.
Maybe a warning comment sould be shown in the menu when enabling IPv6,
that the kernel support for IPv6 chould be checked...


Regards
Sagaert Johan
