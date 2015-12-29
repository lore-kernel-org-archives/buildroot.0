From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 29 Dec 2015 09:07:24 +0200
Subject: [Buildroot] [PATCH 1/1] xdotool: new package
In-Reply-To: <1451354367-26073-1-git-send-email-nunes.erico@gmail.com>
References: <1451354367-26073-1-git-send-email-nunes.erico@gmail.com>
Message-ID: <20151229070724.GA1990@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Erico,

On Mon, Dec 28, 2015 at 11:59:27PM -0200, Erico Nunes wrote:
> +################################################################################
> +#
> +# xdotool
> +#
> +################################################################################
> +
> +XDOTOOL_VERSION = v3.20150503.1
> +XDOTOOL_SITE = $(call github,jordansissel,xdotool,$(XDOTOOL_VERSION))
> +XDOTOOL_LICENSE = custom

Should be "BSD-3c". Compare COPYRIGHT to 
https://opensource.org/licenses/BSD-3-Clause.

> +XDOTOOL_LICENSE_FILES = COPYRIGHT

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
