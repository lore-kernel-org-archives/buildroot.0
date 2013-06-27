From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 27 Jun 2013 21:58:20 +0200
Subject: [Buildroot] [PATCH] toolchain/uClibc: properly honor DEBUG and
	STRIP options
In-Reply-To: <1371823618-23372-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Fri, 21 Jun 2013 11:06:58 -0300")
References: <1371823618-23372-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87fvw31g2r.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> The default uClibc configurations strip the resulting
 Gustavo> binaries/libraries and don't add debug symbols which is a
 Gustavo> problem when wanting to debug issues.  Bind the buildroot
 Gustavo> BR2_STRIP_* option to uClibc .config DO_STRIP and
 Gustavo> BR2_ENABLE_DEBUG to uClibc DO_DEBUG.

Committed, thanks.

-- 
Bye, Peter Korsgaard
