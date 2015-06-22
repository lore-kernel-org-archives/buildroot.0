From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 22 Jun 2015 20:32:32 +0300
Subject: [Buildroot] [PATCH v2 1/2] host-zynq-boot-bin: new package
In-Reply-To: <1434971728-16094-2-git-send-email-xvikto03@stud.fit.vutbr.cz>
References: <20150618231816.513316f9@free-electrons.com>
 <1434971728-16094-1-git-send-email-xvikto03@stud.fit.vutbr.cz>
 <1434971728-16094-2-git-send-email-xvikto03@stud.fit.vutbr.cz>
Message-ID: <20150622173232.GU2303@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jan,

On Mon, Jun 22, 2015 at 01:15:27PM +0200, Jan Viktorin wrote:
> +HOST_ZYNQ_BOOT_BIN_DEPENDENCIES = uboot host-python
> +HOST_ZYNQ_BOOT_BIN_NEEDS_PYTHON = python2

Python (2.6 or 2.7) is already a required package for Buildroot 
(http://nightly.buildroot.org/manual.html#requirement-mandatory).

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
