From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 9 Aug 2018 10:10:55 +0200
Subject: [Buildroot] [PATCH] wireshark: bump version to 2.2.16 (security)
In-Reply-To: <20180808204005.24356-1-nerv@dawncrow.de>
References: <20180808204005.24356-1-nerv@dawncrow.de>
Message-ID: <20180809101055.0d7fedc5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  8 Aug 2018 22:40:05 +0200, Andr? Hentschel wrote:
> Security fixes since 2.2.15:
> 
> - wnpa-sec-2018-06
>   RPKI-Router infinite loop. Bug 14414. CVE-2018-7325.
> - wnpa-sec-2018-34
>   BGP dissector large loop. Bug 13741. CVE-2018-14342.
> - wnpa-sec-2018-35
>   ISMP dissector crash. Bug 14672. CVE-2018-14344.
> - wnpa-sec-2018-36
>   Multiple dissectors could crash. Bug 14675. CVE-2018-14340.
> - wnpa-sec-2018-37
>   ASN.1 BER dissector crash. Bug 14682. CVE-2018-14343.
> - wnpa-sec-2018-38
>   MMSE dissector infinite loop. Bug 14738. CVE-2018-14339.
> - wnpa-sec-2018-39
>   DICOM dissector crash. Bug 14742. CVE-2018-14341.
> - wnpa-sec-2018-40
>   Bazaar dissector infinite loop. Bug 14841.
> - wnpa-sec-2018-41
>   HTTP2 dissector crash. Bug 14869.
> 
> Full release notes:
> 
>   https://www.wireshark.org/docs/relnotes/wireshark-2.2.16.html
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
