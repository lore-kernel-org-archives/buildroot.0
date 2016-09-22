From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 22 Sep 2016 06:41:42 +0300
Subject: [Buildroot] [PATCH 1/1] shapelib: new package
In-Reply-To: <8760pprm82.fsf@dell.be.48ers.dk>
References: <1469969150-3029-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
 <20160921155729.1c4332b7@free-electrons.com>
 <20160921164753.j56sstaxx7jy4j66@tarshish>
 <20160921200430.74f46a81@free-electrons.com>
 <8760pprm82.fsf@dell.be.48ers.dk>
Message-ID: <20160922034142.itfvvgp56mdxcslu@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Wed, Sep 21, 2016 at 11:12:29PM +0200, Peter Korsgaard wrote:
> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
>  > On Wed, 21 Sep 2016 19:47:53 +0300, Baruch Siach wrote:
>  >> A DEVELOPERS file update on every new package makes cherry-picking 
>  >> harder. For that reason, I think, Peter stopped updating the CHANGES 
>  >> file in every patch.
> 
>  > Right. What should we do then? Update the DEVELOPERS file in a separate
>  > patch? But then we're going to have zillions of patches whose sole
>  > purpose of to update the DEVELOPERS file. But of course, that's better
>  > for cherry-picking.
> 
> Either that or I update DEVELOPERS when I also update CHANGES, but not
> everyone might want to get listed / might want to get listed without
> being the author of the commit adding the package.

A DEVELOPERS entry is probably most useful when the package is first added, as 
it starts showing up in the autobuilder. Delaying the DEVELOPERS update 
reduces its usefulness.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
