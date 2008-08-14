From: Christopher Taylor <chtaylo3@gmail.com>
Date: Thu, 14 Aug 2008 15:41:42 -0400
Subject: [Buildroot] GDB attempting to apply patches severla times
Message-ID: <2590773a0808141241u4210fa5bh114585858cff6080@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Has anyone noticed that buildroot attempts to apply the GDB  patches twice?

Seems like this only happens when I have buildroot build GDB for the
target (as a server and regularly) and for the host.  When I take the
host out, it seems to work ok....

-Chris
