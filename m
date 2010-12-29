From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 29 Dec 2010 09:20:36 +0100
Subject: [Buildroot] [PATCH] uclibc: fix configs for 0.9.32 & snapshot
In-Reply-To: <1293565090-6483-1-git-send-email-gustavo@zacarias.com.ar>
	(Gustavo Zacarias's message of "Tue, 28 Dec 2010 16:38:09 -0300")
References: <1293565090-6483-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87tyhxj8h7.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> * 0.9.32 config needs UCLIBC_HAS___PROGNAME defined or we stall when
 Gustavo>   program invocation name is enabled.
 Gustavo> * Mirror 0.9.32's config to snapshot for consistency.

Committed, thanks.

-- 
Bye, Peter Korsgaard
