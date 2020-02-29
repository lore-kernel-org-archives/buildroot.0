From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 29 Feb 2020 18:16:15 +0100
Subject: [Buildroot] [PATCH 1/1] package/mbedtls: security bump to
 version 2.16.4
In-Reply-To: <20200117215121.2568169-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 17 Jan 2020 22:51:21 +0100")
References: <20200117215121.2568169-1-fontaine.fabrice@gmail.com>
Message-ID: <87ftetgvq8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix CVE-2019-18222: Our bignum implementation is not constant
 > time/constant trace, so side channel attacks can retrieve the blinded
 > value, factor it (as it is smaller than RSA keys and not guaranteed to
 > have only large prime factors), and then, by brute force, recover the
 > key. Reported by Alejandro Cabrera Aldaya and Billy Brumley.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.11.x, thanks.

For 2019.02.x I will instead bump to 2.7.13.

-- 
Bye, Peter Korsgaard
