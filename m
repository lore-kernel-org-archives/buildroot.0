From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 28 Mar 2016 20:51:20 +0300
Subject: [Buildroot] [PATCH v2] toolchain-external: Commonize
 /lib/<tuple> symlinks
In-Reply-To: <1459186584-4229-1-git-send-email-matt.fornero@mathworks.com>
References: <1459186584-4229-1-git-send-email-matt.fornero@mathworks.com>
Message-ID: <20160328175120.GN2637@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Matthew,

On Mon, Mar 28, 2016 at 01:36:24PM -0400, Matthew Fornero wrote:
> +config BR2_TOOLCHAIN_EXTERNAL_PREFIX_SYMLINK
> +	bool "Symlink /lib/<tuple>"
> +	help
> +	  Select this option if your external toolchain needs a symlink
> +	  from the /lib directory to the /lib/<tuple> directory. This is
> +	  may be required if your toolchain is based on one from Linaro.

Redundant 'is'.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
