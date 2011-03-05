From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 05 Mar 2011 15:15:50 +0100
Subject: [Buildroot] [PATCH] squashfs: readd legacy lzma support
In-Reply-To: <1299247814-22629-1-git-send-email-gustavo@zacarias.com.ar>
	(Gustavo Zacarias's message of "Fri, 4 Mar 2011 11:10:14 -0300")
References: <1299247814-22629-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <874o7hodpl.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Readd legacy LZMA support since older patched kernels might be
 Gustavo> using it.  Introduce an XZ target filesystem option for the
 Gustavo> new format.

Committed with a small tweak, thanks.

-- 
Bye, Peter Korsgaard
