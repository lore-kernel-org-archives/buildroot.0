From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 9 Apr 2018 11:12:35 +0200
Subject: [Buildroot] [PATCH] wireshark: bump version to 2.2.14 (security)
In-Reply-To: <1523105943-2483-1-git-send-email-nerv@dawncrow.de>
References: <1523105943-2483-1-git-send-email-nerv@dawncrow.de>
Message-ID: <20180409111235.2cf90f42@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  7 Apr 2018 14:59:03 +0200, Andr? Hentschel wrote:
> Security fixes since 2.2.12:
> 
> - wnpa-sec-2018-15
>   The MP4 dissector could crash. (Bug 13777)
> - wnpa-sec-2018-16
>   The ADB dissector could crash. (Bug 14460)
> - wnpa-sec-2018-17
>   The IEEE 802.15.4 dissector could crash. (Bug 14468)
> - wnpa-sec-2018-18
>   The NBAP dissector could crash. (Bug 14471)
> - wnpa-sec-2018-19
>   The VLAN dissector could crash. (Bug 14469)
> - wnpa-sec-2018-20
>   The LWAPP dissector could crash. (Bug 14467)
> - wnpa-sec-2018-23
>   The Kerberos dissector could crash. (Bug 14576)
> - wnpa-sec-2018-05
>   The IEEE 802.11 dissector could crash. Bug 14442, CVE-2018-7335
> - wnpa-sec-2018-06
>   Multiple dissectors could go into large infinite loops. All ASN.1 BER dissectors (Bug 14444), along with the DICOM (Bug 14411), DMP (Bug 14408), LLTD (Bug 14419), OpenFlow (Bug 14420), RELOAD (Bug 14445), RPCoRDMA (Bug 14449), RPKI-Router (Bug 14414), S7COMM (Bug 14423), SCCP (Bug 14413), Thread (Bug 14428), Thrift (Bug 14379), USB (Bug 14421), and WCCP (Bug 14412) dissectors were susceptible.
> - wnpa-sec-2018-07
>   The UMTS MAC dissector could crash. Bug 14339, CVE-2018-7334
> - wnpa-sec-2018-09
>   The FCP dissector could crash. Bug 14374, CVE-2018-7336
> - wnpa-sec-2018-10
>   The SIGCOMP dissector could crash. Bug 14398, CVE-2018-7320
> - wnpa-sec-2018-11
>   The pcapng file parser could crash. Bug 14403, CVE-2018-7420
> - wnpa-sec-2018-12
>   The IPMI dissector could crash. Bug 14409, CVE-2018-7417
> - wnpa-sec-2018-13
>   The SIGCOMP dissector could crash. Bug 14410, CVE-2018-7418
> -  wnpa-sec-2018-14
>   The NBAP disssector could crash. Bug 14443, CVE-2018-7419
> 
> Full release notes:
> 
>   https://www.wireshark.org/docs/relnotes/wireshark-2.2.14.html
> 
> Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
> ---
>  package/wireshark/wireshark.hash | 4 ++--
>  package/wireshark/wireshark.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
