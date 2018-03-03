From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 03 Mar 2018 23:26:39 +0100
Subject: [Buildroot] [PATCH master] dhcp: add upstream security fixes
In-Reply-To: <93f778684109325d734bfccd28ffa23485c95cfc.1520106236.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Sat, 3 Mar 2018 21:43:56 +0200")
References: <93f778684109325d734bfccd28ffa23485c95cfc.1520106236.git.baruch@tkos.co.il>
Message-ID: <871sh0bxsw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > CVE-2018-5732: The DHCP client incorrectly handled certain malformed
 > responses. A remote attacker could use this issue to cause the DHCP
 > client to crash, resulting in a denial of service, or possibly execute
 > arbitrary code. In the default installation, attackers would be isolated
 > by the dhclient AppArmor profile.

 > CVE-2018-5733: The DHCP server incorrectly handled reference counting. A
 > remote attacker could possibly use this issue to cause the DHCP server
 > to crash, resulting in a denial of service.

 > Both issues are fixed in version 4.4.1. But we are close to release, so
 > backport the fixes instead of bumping version.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
