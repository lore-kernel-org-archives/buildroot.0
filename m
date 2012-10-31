From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 31 Oct 2012 07:01:10 +0200
Subject: [Buildroot] [PATCH] package: add linknx
In-Reply-To: <1351599843-24291-3-git-send-email-gregory.hermant@calao-systems.com>
References: <1351599843-24291-1-git-send-email-gregory.hermant@calao-systems.com>
 <1351599843-24291-3-git-send-email-gregory.hermant@calao-systems.com>
Message-ID: <20121031050110.GA30343@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gregory,

On Tue, Oct 30, 2012 at 01:24:02PM +0100, Gregory Hermant wrote:
[...]
> +config BR2_PACKAGE_LINKNX
> +	bool "linknx"
> +	select BR2_PACKAGE_LIBPTHSEM
> +	help
> +	  Linknx is only one component of a bigger project.The goal is to get
> +	  the maximum comfort and flexibility from a KNX domotic system while
> +	  keeping the smallest possible resource consumption.
> +
> +	  http://belnet.dl.sourceforge.net/sourceforge/linknx/

Broken link. Should probably be http://linknx.sourceforge.net/.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
