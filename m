From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Aug 2015 14:14:56 +0200
Subject: [Buildroot] [PATCH] wireshark: security bump to version 1.12.7
In-Reply-To: <1439463895-29663-1-git-send-email-gustavo@zacarias.com.ar>
References: <1439463895-29663-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150818141456.0e9d1872@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Thu, 13 Aug 2015 08:04:55 -0300, Gustavo Zacarias wrote:
> Fixes:
> wnpa-sec-2015-21 - Protocol tree crash.
> wnpa-sec-2015-22 - Memory manager crash.
> wnpa-sec-2015-23 - Dissector table crash.
> wnpa-sec-2015-24 - ZigBee crash.
> wnpa-sec-2015-25 - GSM RLC/MAC inifite loop.
> wnpa-sec-2015-26 - WaveAgent crash.
> wnpa-sec-2015-27 - OpenFlow infinite loop.
> wnpa-sec-2015-28 - Ptvcursor crash.
> wnpa-sec-2015-29 - WCCP crash.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/wireshark/wireshark.hash | 6 +++---
>  package/wireshark/wireshark.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to master, since it's a security bump, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
