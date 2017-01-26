From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Jan 2017 22:34:45 +0100
Subject: [Buildroot] [PATCH] openssl: security bump to version 1.0.2k
In-Reply-To: <20170126200756.29248-1-gustavo@zacarias.com.ar> (Gustavo
 Zacarias's message of "Thu, 26 Jan 2017 17:07:56 -0300")
References: <20170126200756.29248-1-gustavo@zacarias.com.ar>
Message-ID: <87mvedcxoq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes:
 > CVE-2017-3731 - Truncated packet could crash via OOB read.
 > CVE-2017-3732 - BN_mod_exp may produce incorrect results on x86_64
 > CVE-2016-7055 - Montgomery multiplication may produce incorrect results

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
