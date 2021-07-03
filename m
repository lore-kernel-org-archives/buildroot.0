From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Jul 2021 23:36:54 +0200
Subject: [Buildroot] [PATCH 1/1] package/libtasn1: security bump to
 version 4.17.0
In-Reply-To: <20210613210013.1565385-1-fontaine.fabrice@gmail.com>
References: <20210613210013.1565385-1-fontaine.fabrice@gmail.com>
Message-ID: <20210703233654.1040ddca@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 13 Jun 2021 23:00:13 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Fix some clang issues due to illegal pointers, thanks to Stefan Weil.
> - Fix memory leak caught by oss-fuzz, thanks to Dmitry Baryshkov.
> - Fix bugs unveiled by Static Analysis, reported by Simo Sorce.
> 
> - LICENSE has been renamed to COPYING since
>   https://gitlab.com/gnutls/libtasn1/-/commit/a72a8d1ef13436bf8916097f11c3fc90f07ba911
> 
> https://gitlab.com/gnutls/libtasn1/-/blob/v4.17.0/NEWS
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libtasn1/libtasn1.hash | 6 +++---
>  package/libtasn1/libtasn1.mk   | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
