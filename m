From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 03 Sep 2013 23:47:37 +0200
Subject: [Buildroot] [PATCH] pcre: fix C++ static build problem
In-Reply-To: <1378218795-1350-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 3 Sep 2013 11:33:15 -0300")
References: <1378218795-1350-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87hae160hy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> PCRE C++ unit tests fails to build properly for static scenarios since
 Gustavo> it's not taken account for properly in the build system.
 Gustavo> Just disable them, they're never installed to the target.
 Gustavo> Fixes:
 Gustavo> http://autobuild.buildroot.net/results/970/97027b981659502ff12c345c3caef4933cddb354/

Committed, thanks.

-- 
Bye, Peter Korsgaard
