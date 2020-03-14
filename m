From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Mar 2020 15:36:51 +0100
Subject: [Buildroot] [PATCH 1/1] package/mbedtls: security bump to
 version 2.16.5
In-Reply-To: <20200221215646.295828-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 21 Feb 2020 22:56:46 +0100")
References: <20200221215646.295828-1-fontaine.fabrice@gmail.com>
Message-ID: <877dznxat8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 >  - Fix potential memory overread when performing an ECDSA signature
 >    operation. The overread only happens with cryptographically low
 >    probability (of the order of 2^-n where n is the bitsize of the
 >    curve) unless the RNG is broken, and could result in information
 >    disclosure or denial of service (application crash or extra resource
 >    consumption).
 >  - To avoid a side channel vulnerability when parsing an RSA private
 >    key, read all the CRT parameters from the DER structure rather than
 >    reconstructing them.
 >  - Update indentation of hash file (two spaces)

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.11.x, thanks.

For 2019.02.x I will instead bump to 2.7.14.

-- 
Bye, Peter Korsgaard
