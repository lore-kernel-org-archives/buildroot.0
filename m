From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Mar 2016 20:50:23 +0100
Subject: [Buildroot] [PATCH] bind: security bump to version 9.10.3-P4
In-Reply-To: <1457630548-3963-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 10 Mar 2016 14:22:28 -0300")
References: <1457630548-3963-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87io0um7sw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes:
 > CVE-2016-1285 - An error parsing input received by the rndc control
 > channel can cause an assertion failure in sexpr.c or alist.c
 > CVE-2016-1286 - A problem parsing resource record signatures for DNAME
 > resource records can lead to an assertion failure in resolver.c or db.c
 > CVE-2016-2088 - A response containing multiple DNS cookies causes
 > servers with cookie support enabled to exit with an assertion failure.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
