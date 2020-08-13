From: Petr Vorel <petr.vorel@gmail.com>
Date: Thu, 13 Aug 2020 19:38:30 +0200
Subject: [Buildroot] {name,
 open}_to_handle_at() not implemented on uclibc-ng (iproute2 5.8.0
 dependency)
Message-ID: <20200813173830.GA28354@dell5510>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

does anybody plan to implement {name,open}_to_handle_at() in uclibc-ng?
These are new dependencies for iproute2.

2 years ago it was just removed from bits/fcntl.h in 42ff2bba8 ("uClibc-ng does
not implement name_to_handle_at").

Kind regards,
Petr
