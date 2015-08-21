From: Brendan Heading <brendanheading@gmail.com>
Date: Fri, 21 Aug 2015 01:12:27 +0100
Subject: [Buildroot] bootm - "Starting kernel"
In-Reply-To: <944894A3EB1D044A9003B2F944389BB20474AD968D@svr-wa-exch1.atg.lc>
References: <893D978F8A8D2B40A4CC1A09F0844518045BB12971@svr-wa-exch1.atg.lc>
 <944894A3EB1D044A9003B2F944389BB20474AD9614@svr-wa-exch1.atg.lc>
 <CA+BsyQ7GRYhUA-2aJ+4qxaFnr6g0740B9sxEkGhXNEQ84ct3bw@mail.gmail.com>
 <944894A3EB1D044A9003B2F944389BB20474AD968D@svr-wa-exch1.atg.lc>
Message-ID: <CA+BsyQ5fZ=0krEW1ctCCV5R5Jaswe90_v6TYir0kGoEHK=FdHA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> FYI, I unplugged the Ethernet cable and did the steps again. This time the
> same ?tty: bad speedgetty? message is still repeated.

Nothing to do with ethernet - it sounds like it's trying to start
getty but there's an issue with the speeds. The error message comes
from loginutils/getty.c inside busybox.

Did you mess around with /etc/inittab, or did you leave it at the defaults ?

Brendan
