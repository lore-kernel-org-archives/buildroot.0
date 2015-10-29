From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 Oct 2015 20:04:19 +0100
Subject: [Buildroot] [PATCH] python-spidev: bump to version 3.1
In-Reply-To: <1446116134-31005-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 29 Oct 2015 07:55:34 -0300")
References: <1446116134-31005-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <8737wt4hu4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Also add hash file.
 > And fixes:
 > http://autobuild.buildroot.net/results/abc/abca38e3e93b609c1040c1152de7cd59940e2c88/
 > It was using an absolute include_dirs in setup.py pointing to the host
 > kernel sources (/usr/src/linux). It didn't affect "normal" distros since
 > they normally don't have the kernel sources installed, however for
 > Gentoo it's quite normal to have kernel sources there.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
