From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 29 Nov 2013 19:43:23 +0100
Subject: [Buildroot] [PATCH] hostapd: fix static build failure
In-Reply-To: <1385735143-8323-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Fri, 29 Nov 2013 11:25:43 -0300")
References: <1385735143-8323-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <877gbrvyk4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > libnl-3 uses threads and this isn't accounted for in hostapd (or
 > libnl-3*.pc files for that matter - hostapd doesn't use pkg-config
 > anyway).
 > Since linking order matters for static scenarios also throw in -lnl-3
 > into LIBS first since it gets appended to in hostapd makefiles to add
 > libnl-3.

 > Fixes:
 > http://autobuild.buildroot.net/results/d4a/d4a9f44effeb08eda6c4b32764274ae81d185d5e/

Committed, thanks.

-- 
Bye, Peter Korsgaard
