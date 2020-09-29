From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Sep 2020 17:33:59 +0200
Subject: [Buildroot] [PATCH 1/1] package/samba4: security bump version
 to 4.11.13
In-Reply-To: <20200920074328.763948-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sun, 20 Sep 2020 09:43:28 +0200")
References: <20200920074328.763948-1-bernd.kuhls@t-online.de>
Message-ID: <87wo0cwqag.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Version 4.11.11 fixed
 > o CVE-2020-10730: NULL pointer de-reference and use-after-free in Samba AD DC
 > 		  LDAP Server with ASQ, VLV and paged_results.
 > o CVE-2020-10745: Parsing and packing of NBT and DNS packets can consume
 > 		  excessive CPU
 > o CVE-2020-10760: LDAP Use-after-free in Samba AD DC Global Catalog with
 > 		  paged_results and VLV.
 > o CVE-2020-14303: Empty UDP packet DoS in Samba AD DC nbtd.

 > Version 4.11.12 was a bugfix-only release.

 > Version 4.11.13 fixes CVE-2020-1472.

 > Release notes:
 > https://www.samba.org/samba/history/samba-4.11.11.html
 > https://www.samba.org/samba/history/samba-4.11.12.html
 > https://www.samba.org/samba/security/CVE-2020-1472.html

 > Rebased patches 0001 & 0002.

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2020.02.x, 2020.05.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
