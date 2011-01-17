From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 17 Jan 2011 20:50:47 +0100
Subject: [Buildroot] [PATCH 12/13] php: security bump to 5.2.17
In-Reply-To: <1294431182-27793-12-git-send-email-gustavo@zacarias.com.ar>
	(Gustavo Zacarias's message of "Fri, 7 Jan 2011 17:13:01 -0300")
References: <1294431182-27793-1-git-send-email-gustavo@zacarias.com.ar>
	<1294431182-27793-12-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87oc7fmhrc.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> PHP bug #53632 and CVE-2010-4645, where conversions from
 Gustavo> string to double might cause the PHP interpreter to hang on
 Gustavo> systems using x87 FPU registers.

 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
