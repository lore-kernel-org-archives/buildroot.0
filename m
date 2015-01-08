From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Jan 2015 19:20:32 +0100
Subject: [Buildroot] [PATCH] wireshark: security bump to version 1.12.3
In-Reply-To: <1420738175-3541-1-git-send-email-gustavo@zacarias.com.ar>
References: <1420738175-3541-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150108192032.359c0715@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Thu,  8 Jan 2015 14:29:35 -0300, Gustavo Zacarias wrote:
> Fixes:
> CVE-2015-0559, CVE-2015-0560 - The WCCP dissector could crash.
> CVE-2015-0561 - The LPP dissector could crash.
> CVE-2015-0562 - The DEC DNA Routing Protocol dissector could crash.
> CVE-2015-0563 - The SMTP dissector could crash.
> CVE-2015-0564 - Wireshark could crash while decypting TLS/SSL sessions.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/wireshark/wireshark.hash | 6 +++---
>  package/wireshark/wireshark.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
