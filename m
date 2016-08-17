From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 Aug 2016 08:43:18 +0200
Subject: [Buildroot] [PATCH] jasper: add security patches
In-Reply-To: <1471395954-27868-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 16 Aug 2016 22:05:54 -0300")
References: <1471395954-27868-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87inuzsxo9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes:
 > CVE-2016-2116 - Memory leak in jas_iccprof_createfrombuf causing
 > memory consumption.
 > CVE-2016-1577 - Double free vulnerability in jas_iccattrval_destroy.
 > CVE-2016-1867 - out-of-bounds read in the jpc_pi_nextcprl() function.
 > CVE-2015-5221 - Use-after-free and double-free flaws in Jasper
 > JPEG-2000 library.
 > CVE-2015-5203 - double free in jasper_image_stop_load()

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
