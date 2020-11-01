From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Nov 2020 10:01:58 +0100
Subject: [Buildroot] [PATCH 1/1] package/wireshark: security bump to
 version 3.2.8
In-Reply-To: <20201031233227.1682264-1-fontaine.fabrice@gmail.com>
References: <20201031233227.1682264-1-fontaine.fabrice@gmail.com>
Message-ID: <20201101100158.46a2acb0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  1 Nov 2020 00:32:27 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Fix CVE-2020-26575: In Wireshark through 3.2.7, the Facebook Zero
>   Protocol (aka FBZERO) dissector could enter an infinite loop. This was
>   addressed in epan/dissectors/packet-fbzero.c by correcting the
>   implementation of offset advancement.
>   https://www.wireshark.org/security/wnpa-sec-2020-14.html
> - Fix GQUIC dissector crash:
>   https://www.wireshark.org/security/wnpa-sec-2020-15.html
> 
> https://www.wireshark.org/docs/relnotes/wireshark-3.2.8.html
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/wireshark/wireshark.hash | 6 +++---
>  package/wireshark/wireshark.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
