From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 15 Jan 2013 21:41:47 +0100
Subject: [Buildroot] [PATCH] openvpn: bump to version 2.3.0
In-Reply-To: <1358267166-9495-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 15 Jan 2013 13:26:06 -0300")
References: <1358267166-9495-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <8738y2mb5g.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Toolchain IPv6 support isn't optional any more.
 Gustavo> New PolarSSL backend besides the usual OpenSSL one.
 Gustavo> New small binary option, reduces binary file size ~100 KiB depending on
 Gustavo> target architecture.

 Gustavo> Removed no crypto option - it still requires some SSL library
 Gustavo> headers and it's pointless anyway, after all we're talking
 Gustavo> about a VPN solution here.

Committed, thanks.

-- 
Bye, Peter Korsgaard
