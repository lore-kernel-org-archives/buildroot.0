From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 05 Sep 2020 09:43:08 +0200
Subject: [Buildroot] [PATCH 1/1] package/mbedtls: security bump to
 version 2.16.8
In-Reply-To: <20200901181503.2390512-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 1 Sep 2020 20:15:03 +0200")
References: <20200901181503.2390512-1-fontaine.fabrice@gmail.com>
Message-ID: <87pn70lldf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix a "Local side channel attack on classical CBC decryption in (D)TLS"
 > a.k.a. CVE-2020-16150:
 > https://tls.mbed.org/tech-updates/security-advisories/mbedtls-security-advisory-2020-09-1

 > as well as a "Local side channel attack on RSA and static
 > Diffie-Hellman" (no CVE):
 > https://tls.mbed.org/tech-updates/security-advisories/mbedtls-security-advisory-2020-09-2

 > Also change MBEDTLS_SITE and retrieve hash provided by upstream

 > https://github.com/ARMmbed/mbedtls/releases/tag/v2.16.8

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
