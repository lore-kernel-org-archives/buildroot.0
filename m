From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 22 Dec 2020 11:53:44 +0100
Subject: [Buildroot] [PATCH 1/1] package/cryptopp: security bump to
 version 8.3.0
In-Reply-To: <20201220175556.10038-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 20 Dec 2020 18:55:56 +0100")
References: <20201220175556.10038-1-fontaine.fabrice@gmail.com>
Message-ID: <87ft3ykt6v.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Fix CVE-2019-14318: Crypto++ 8.3.0 and earlier contains a timing side
 >   channel in ECDSA signature generation. This allows a local or remote
 >   attacker, able to measure the duration of hundreds to thousands of
 >   signing operations, to compute the private key used. The issue occurs
 >   because scalar multiplication in ecp.cpp (prime field curves, small
 >   leakage) and algebra.cpp (binary field curves, large leakage) is not
 >   constant time and leaks the bit length of the scalar among other
 >   information.
 > - Update license hash due to the addition of ARM SHA1 and SHA256 asm
 >   implementation from Cryptogams
 >   https://github.com/weidai11/cryptopp/commit/1a63112faf5af60e0ebcc60654eef806e7f6f11a
 >   https://github.com/weidai11/cryptopp/commit/4c9ca6b723b5ec5aab7eec720ad4d22598abe941

 > https://www.cryptopp.com/release830.html

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x, 2020.08.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
