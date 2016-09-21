From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 21 Sep 2016 19:47:53 +0300
Subject: [Buildroot] [PATCH 1/1] shapelib: new package
In-Reply-To: <20160921155729.1c4332b7@free-electrons.com>
References: <1469969150-3029-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
 <20160921155729.1c4332b7@free-electrons.com>
Message-ID: <20160921164753.j56sstaxx7jy4j66@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Sep 21, 2016 at 03:57:29PM +0200, Thomas Petazzoni wrote:
> Thanks, I've applied your patch, after doing the following changes:
> 
>     [Thomas:
>      - adjust the license: it's MIT or LGPLv2, add web/license.html to the
>        license files
>      - rewrap Config.in help text
>      - add entry to the DEVELOPERS file.]

A DEVELOPERS file update on every new package makes cherry-picking harder. For 
that reason, I think, Peter stopped updating the CHANGES file in every patch.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
