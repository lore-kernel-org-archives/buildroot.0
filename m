From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Dec 2015 14:53:31 +0100
Subject: [Buildroot] [PATCH] wireshark: security bump to version 2.0.1
In-Reply-To: <1451477875-18546-1-git-send-email-gustavo@zacarias.com.ar>
References: <1451477875-18546-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20151230145331.2f3540e7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 30 Dec 2015 09:17:55 -0300, Gustavo Zacarias wrote:
> Fixes:
> wnpa-sec-2015-31 - NBAP dissector crashes
> wnpa-sec-2015-37 - NLM dissector crashes
> wnpa-sec-2015-39 - BER dissector crashes
> wnpa-sec-2015-40 - Zlib decompression crash
> wnpa-sec-2015-41 - SCTP dissector crashes
> wnpa-sec-2015-42 - 802.11 decryption crash
> wnpa-sec-2015-43 - DIAMETER dissector crash
> wnpa-sec-2015-44 - VeriWave file parser crashes
> wnpa-sec-2015-45 - RSVP dissector crash
> wnpa-sec-2015-46 - ANSI A & GSM A dissector crashes
> wnpa-sec-2015-47 - Ascend file parser crash
> wnpa-sec-2015-48 - NBAP dissector crash
> wnpa-sec-2015-49 - RSL dissector crash
> wnpa-sec-2015-50 - ZigBee ZCL dissector crash
> wnpa-sec-2015-51 - Sniffer file parser crash
> wnpa-sec-2015-52 - NWP dissector crash
> wnpa-sec-2015-53 - BT ATT disector crash
> wnpa-sec-2015-54 - MP2T file parser crash
> wnpa-sec-2015-55 - MP2T file parser crash
> wnpa-sec-2015-56 - S7COMM disector crash
> wnpa-sec-2015-57 - IPMI dissector crash
> wnpa-sec-2015-58 - TDS dissector crash
> wnpa-sec-2015-59 - PPI dissector crash
> wnpa-sec-2015-60 - MS-WSP dissector crash
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/wireshark/wireshark.hash | 4 ++--
>  package/wireshark/wireshark.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
