From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Jun 2017 14:38:59 +0200
Subject: [Buildroot] [PATCH] openvpn: security bump to version 2.4.3
In-Reply-To: <f7fbcb2f29c958e7755a400ecc26d5d92e172790.1498154097.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Thu, 22 Jun 2017 20:54:57 +0300")
References: <f7fbcb2f29c958e7755a400ecc26d5d92e172790.1498154097.git.baruch@tkos.co.il>
Message-ID: <87k23yhqjg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Fixes:
 > CVE-2017-7508 - Remotely-triggerable ASSERT() on malformed IPv6 packet

 > CVE-2017-7520 - Pre-authentication remote crash/information disclosure for
 > clients

 > CVE-2017-7521 - Potential double-free in --x509-alt-username

 > CVE-2017-7521 - Remote-triggerable memory leaks

 > CVE-2017-7522 - Post-authentication remote DoS when using the --x509-track
 > option

 > Details at

 >   https://community.openvpn.net/openvpn/wiki/VulnerabilitiesFixedInOpenVPN243

 > Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2017.02.x and 2017.05.x, thanks.

-- 
Bye, Peter Korsgaard
