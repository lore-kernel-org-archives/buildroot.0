From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 09 Jan 2017 16:49:33 +0100
Subject: [Buildroot] [PATCH] gnutls: security bump to version 3.5.8
In-Reply-To: <20170109143220.24790-1-gustavo@zacarias.com.ar> (Gustavo
 Zacarias's message of "Mon, 9 Jan 2017 11:32:20 -0300")
References: <20170109143220.24790-1-gustavo@zacarias.com.ar>
Message-ID: <871swcnshe.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > The 3.5.x has been promoted to stable, hence 3.4.x is deprecated and
 > 3.3.x kept as old-stable.

 > libdane now specifies LGPLv2.1+ so drop the README kludge (which is also
 > gone regarding licensing).

 > libunistring is a new dependency, even though gnutls ships a builtin version
 > we prefer to use unbundled to avoid duplication with other users and target
 > size growth.

 > Fixes:

 > GNUTLS-SA-2017-01 - It was found using the OSS-FUZZ fuzzer
 > infrastructure that decoding a specially crafted X.509 certificate with
 > Proxy Certificate Information extension present could lead to a double
 > free.
 > GNUTLS-SA-2017-02 - It was found using the OSS-FUZZ fuzzer
 > infrastructure that decoding a specially crafted OpenPGP certificate
 > could lead to heap and stack overflows.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>


Committed, thanks.

-- 
Bye, Peter Korsgaard
