From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 17 Jan 2011 22:10:11 +0100
Subject: [Buildroot] [PATCH 2/3] openssl: add ocf support
In-Reply-To: <1295028711-28716-2-git-send-email-gustavo@zacarias.com.ar>
	(Gustavo Zacarias's message of "Fri, 14 Jan 2011 15:11:50 -0300")
References: <1295028711-28716-1-git-send-email-gustavo@zacarias.com.ar>
	<1295028711-28716-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87d3nvkzik.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Enable OCF (cryptodev) support for openssl as an option.
 Gustavo> This requires a patched kernel to export hardware acceleration for
 Gustavo> openssl to use it.
 Gustavo> If you lack a patched kernel or support it won't break anything, it will
 Gustavo> simply fall back to the default software engine from openssl, you'll
 Gustavo> just have a slightly bigger libssl/libcrypto.

 Gustavo> Tested with 20100325 release + 20101223 patch from the mailing list.

Committed, thanks.

-- 
Bye, Peter Korsgaard
