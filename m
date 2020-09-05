From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Sep 2020 22:39:09 +0200
Subject: [Buildroot] [PATCH v4 1/1] package/makedumpfile: new package
In-Reply-To: <20200905194749.20109-1-egorenar-dev@posteo.net>
References: <20200905194749.20109-1-egorenar-dev@posteo.net>
Message-ID: <20200905223909.03f2c4ca@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  5 Sep 2020 21:47:49 +0200
Alexander Egorenkov <egorenar-dev@posteo.net> wrote:

> Signed-off-by: Alexander Egorenkov <egorenar-dev@posteo.net>
> ---
>  DEVELOPERS                                    |   3 +
>  package/Config.in                             |   1 +
>  ...move-duplicated-variable-definitions.patch | 104 ++++++++++++++++++
>  ...0002-PATCH-Define-PN_XNUM-if-missing.patch |  25 +++++
>  package/makedumpfile/Config.in                |  18 +++
>  package/makedumpfile/makedumpfile.hash        |   3 +
>  package/makedumpfile/makedumpfile.mk          |  28 +++++
>  7 files changed, 182 insertions(+)
>  create mode 100644 package/makedumpfile/0001-PATCH-Remove-duplicated-variable-definitions.patch
>  create mode 100644 package/makedumpfile/0002-PATCH-Define-PN_XNUM-if-missing.patch
>  create mode 100644 package/makedumpfile/Config.in
>  create mode 100644 package/makedumpfile/makedumpfile.hash
>  create mode 100644 package/makedumpfile/makedumpfile.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
