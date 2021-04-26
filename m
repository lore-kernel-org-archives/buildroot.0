From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Apr 2021 14:36:19 +0200
Subject: [Buildroot] [PATCH 1/1] package/nettle: security bump to
 version 3.7.2
In-Reply-To: <20210418185114.3306357-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 18 Apr 2021 20:51:14 +0200")
References: <20210418185114.3306357-1-fontaine.fabrice@gmail.com>
Message-ID: <87r1ixkyt8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix CVE-2021-20305: A flaw was found in Nettle in versions before 3.7.2,
 > where several Nettle signature verification functions (GOST DSA, EDDSA &
 > ECDSA) result in the Elliptic Curve Cryptography point (ECC) multiply
 > function being called with out-of-range scalers, possibly resulting in
 > incorrect results. This flaw allows an attacker to force an invalid
 > signature, causing an assertion failure or possible validation. The
 > highest threat to this vulnerability is to confidentiality, integrity,
 > as well as system availability.

 > https://git.lysator.liu.se/nettle/nettle/-/blob/nettle_3.7.2_release_20210321/NEWS

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
