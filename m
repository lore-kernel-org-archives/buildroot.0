From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 20 Jun 2016 20:22:15 +0300
Subject: [Buildroot] [PATCH v6] openblas: new package
In-Reply-To: <1466441142-52096-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1466441142-52096-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20160620172215.GA2379@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vicente,

On Mon, Jun 20, 2016 at 05:45:42PM +0100, Vicente Olivert Riera wrote:
> +OPENBLAS_VERSION = a8fcd89d6d1666185c8c27ea46672b9897630f21
> +OPENBLAS_SITE = $(call github,xianyi,OpenBLAS,$(OPENBLAS_VERSION))
> +OPENBLAS_LICENSE = BSD-3

BSD-3c, isn't it?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
