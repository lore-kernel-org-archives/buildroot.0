From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Jun 2020 22:00:54 +0200
Subject: [Buildroot] [PATCH 1/1] package/tcpreplay: security bump to
 version 4.3.3
In-Reply-To: <20200617195654.39410-1-fontaine.fabrice@gmail.com>
References: <20200617195654.39410-1-fontaine.fabrice@gmail.com>
Message-ID: <20200617220054.694d6590@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 17 Jun 2020 21:56:54 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Fix CVE-2020-12740: tcprewrite in Tcpreplay through 4.3.2 has a
>   heap-based buffer over-read during a get_c operation. The issue is
>   being triggered in the function get_ipv6_next() at common/get.c.
> - Update indentation in hash file (two spaces)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/tcpreplay/tcpreplay.hash | 6 +++---
>  package/tcpreplay/tcpreplay.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
