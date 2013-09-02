From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 02 Sep 2013 12:44:10 +0200
Subject: [Buildroot] [PATCH] libmicrohttpd: disable spdy support
In-Reply-To: <1378117184-7653-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Mon, 2 Sep 2013 07:19:44 -0300")
References: <1378117184-7653-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87li3fbj0l.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> It requires OpenSSL and IPv6 support and it should probably be an
 Gustavo> option since SSL support uses GnuTLS thus making a huge target
 Gustavo> footprint with 2 SSL/TLS libraries for full support.
 Gustavo> But most of all it's considered experimental.
 Gustavo> Fixes:
 Gustavo> http://autobuild.buildroot.net/results/836/836c39c11cecbcf9399675ba3ab01202417b9642/

Committed, thanks.

-- 
Bye, Peter Korsgaard
