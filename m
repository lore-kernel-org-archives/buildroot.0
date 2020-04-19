From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 19 Apr 2020 22:20:32 +0200
Subject: [Buildroot] [PATCH 1/1] package/wireshark: security bump to
 version 3.2.3
In-Reply-To: <20200419161026.144201-1-fontaine.fabrice@gmail.com>
References: <20200419161026.144201-1-fontaine.fabrice@gmail.com>
Message-ID: <20200419222032.6dcf4360@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 19 Apr 2020 18:10:26 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix CVE-2020-11647: In Wireshark 3.2.0 to 3.2.2, 3.0.0 to 3.0.9, and
> 2.6.0 to 2.6.15, the BACapp dissector could crash. This was addressed
> in epan/dissectors/packet-bacapp.c by limiting the amount of recursion.
> 
> https://www.wireshark.org/security/wnpa-sec-2020-07.html
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
