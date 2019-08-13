From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 13 Aug 2019 21:40:17 +0200
Subject: [Buildroot] [PATCH 1/3] package/tcpreplay: security bump to
 version 4.3.2
In-Reply-To: <20190813192340.21989-1-fontaine.fabrice@gmail.com>
References: <20190813192340.21989-1-fontaine.fabrice@gmail.com>
Message-ID: <20190813214017.78982b9f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 13 Aug 2019 21:23:38 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> This release contains bug fixes only:
> 
>  - CVE-2019-8381 memory access in do_checksum() (#538)
>  - CVE-2019-8376 NULL pointer dereference get_layer4_v6() (#537)
>  - CVE-2019-8377 NULL pointer dereference get_ipv6_l4proto() (#536)
>  - Rename Ethereal to Wireshark (#545)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/tcpreplay/tcpreplay.hash | 4 ++--
>  package/tcpreplay/tcpreplay.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

Series applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
