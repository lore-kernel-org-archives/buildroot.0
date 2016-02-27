From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Feb 2016 16:28:06 +0100
Subject: [Buildroot] [PATCH] wireshark: security bump to version 2.0.2
In-Reply-To: <1456578313-31287-1-git-send-email-gustavo@zacarias.com.ar>
References: <1456578313-31287-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160227162806.47925dcc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Sat, 27 Feb 2016 10:05:13 -0300, Gustavo Zacarias wrote:

> CVE-2016-2521 - DLL hijacking vulnerability.
> CVE-2016-2522 - ASN.1 BER dissector crash.
> CVE-2016-2523 - DNP dissector infinite loop.
> CVE-2016-2524 - X.509AF dissector crash.
> CVE-2016-2525 - HTTP/2 dissector crash.
> CVE-2016-2526 - HiQnet dissector crash.
> CVE-2016-2527 - 3GPP TS 32.423 Trace file parser crash.
> CVE-2016-2528 - LBMC dissector crash.
> CVE-2016-2529 - iSeries file parser crash.
> CVE-2016-2530 - RSL dissector crash.
> CVE-2016-2531 - RSL dissector crash.
> CVE-2016-2532 - LLRP dissector crash.
> wnpa-sec-2016-12 - Ixia IxVeriWave file parser crash.
> wnpa-sec-2016-13 - IEEE 802.11 dissector crash.
> wnpa-sec-2016-14 - GSM A-bis OML dissector crash.
> wnpa-sec-2016-15 - ASN.1 BER dissector crash.
> wnpa-sec-2016-16 - SPICE dissector large loop.
> wnpa-sec-2016-17 - NFS dissector crash.
> wnpa-sec-2016-18 - ASN.1 BER dissector crash.

Nice set of CVEs :-)

Applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
