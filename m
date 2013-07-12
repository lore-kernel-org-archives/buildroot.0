From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 12 Jul 2013 13:33:35 +0200
Subject: [Buildroot] [PATCH] nodejs: not supported on old ARM cores
In-Reply-To: <1373590735-24767-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 11 Jul 2013 21:58:55 -0300")
References: <1373590735-24767-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87a9lsdncg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> nodejs needs the ARM blx instruction which is only supported in v5t+
 Gustavo> cores (v5 ISA with thumb instructions).
 Gustavo> Disable it for lower cores. Fixes:
 Gustavo> http://autobuild.buildroot.net/results/89e/89ee5ba047a26a8c7a612d0285b08780b70efbd4/

Committed, thanks.

-- 
Bye, Peter Korsgaard
