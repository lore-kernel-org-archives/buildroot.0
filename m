From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 31 Dec 2018 14:31:55 +0100
Subject: [Buildroot] [PATCH] package/wireshark: security bump to version
 2.6.5
In-Reply-To: <20181231083022.4370-1-peter@korsgaard.com>
References: <20181231083022.4370-1-peter@korsgaard.com>
Message-ID: <20181231143155.1fea116e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 31 Dec 2018 09:30:21 +0100, Peter Korsgaard wrote:
> The following vulnerabilities have been fixed:
> 
> - wnpa-sec-2018-51 The Wireshark dissection engine could crash. Bug 14466. CVE-2018-19625.
> - wnpa-sec-2018-52 The DCOM dissector could crash. Bug 15130. CVE-2018-19626.
> - wnpa-sec-2018-53 The LBMPDM dissector could crash. Bug 15132. CVE-2018-19623.
> - wnpa-sec-2018-54 The MMSE dissector could go into an infinite loop. Bug 15250. CVE-2018-19622.
> - wnpa-sec-2018-55 The IxVeriWave file parser could crash. Bug 15279. CVE-2018-19627.
> - wnpa-sec-2018-56 The PVFS dissector could crash. Bug 15280. CVE-2018-19624.
> - wnpa-sec-2018-57 The ZigBee ZCL dissector could crash. Bug 15281. CVE-2018-19628.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/wireshark/wireshark.hash | 4 ++--
>  package/wireshark/wireshark.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
