From: Baruch Siach <baruch@tkos.co.il>
Date: Sat, 28 Feb 2015 21:54:11 +0200
Subject: [Buildroot] [PATCH 1/7] linux: use the package infrastructure
 to download patches
In-Reply-To: <1425147313-17380-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1425147313-17380-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1425147313-17380-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150228195411.GA15668@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sat, Feb 28, 2015 at 07:15:07PM +0100, Thomas Petazzoni wrote:
> +# We really on the generic package infrastructure to download and

s/really/rely/

> +# apply remote patches (downloaded from ftp, http or https). For local
> +# patches, we have a custom post-patch hook below.
> +LINUX_PATCH = $(filter ftp://% http://% https://%,$(LINUX_PATCHES))

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
