From: Martin Peevski <martin@ronetix.at>
Date: Sun, 07 Oct 2012 16:29:09 +0300
Subject: [Buildroot] Kernel sources supplied from my PC
Message-ID: <507183A5.4010006@ronetix.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello, I want to ask you how can I supply some of the needed sources for 
building Linux system from my PC? This is because sometimes I haven't 
server with some custom Kernel version, for example, and have only my PC.

I search in the manual and there have section "Offline builds" but it 
can't help me, I think? When I execute make source the needed sources 
will be downloaded from internet again?

I think that I can copy my sources to /dl directory of Buildroot but 
when execute make distclean it dissapear. Or I must create it manualy 
and then copy my sources there?

Thanks in advance!
Martin.
