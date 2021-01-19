From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 19 Jan 2021 21:58:03 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/chrony: bump to version 4.0
In-Reply-To: <20210102165655.23697-1-mark@dibsco.co.uk>
References: <20210102165655.23697-1-mark@dibsco.co.uk>
Message-ID: <20210119215803.3af5a4b2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  2 Jan 2021 16:56:55 +0000
Mark Corbin <mark@dibsco.co.uk> wrote:

> Update chrony to version 4.0 and add/remove configuration of
> features as necessary.
> 
> Remove support for readline. Add support for nettle and
> gnutls (required for NTS support). Add pkg-config support (for
> nss, nettle and gnutls).
> 
> Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
> ---
> Changes v1 -> v2:
>   - add/remove configuration features as necessary (Peter)
> ---
>  package/chrony/chrony.hash |  4 ++--
>  package/chrony/chrony.mk   | 18 +++++++++++++++---
>  2 files changed, 17 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
