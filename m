From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 02 Feb 2011 22:29:19 +0100
Subject: [Buildroot] [PATCH 5/5] dnsmasq: idn support requires wchar
In-Reply-To: <1296649344-12456-5-git-send-email-gustavo@zacarias.com.ar>
	(Gustavo Zacarias's message of "Wed, 2 Feb 2011 09:22:24 -0300")
References: <1296649344-12456-1-git-send-email-gustavo@zacarias.com.ar>
	<1296649344-12456-5-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <871v3qt9ao.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> IDN support requires wchar, otherwise libintl will fail to build.
 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
