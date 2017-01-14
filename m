From: Baruch Siach <baruch@tkos.co.il>
Date: Sat, 14 Jan 2017 19:35:27 +0200
Subject: [Buildroot] [PATCH] jasper: bump to version 2.0.10
In-Reply-To: <87vatjat58.fsf@dell.be.48ers.dk>
References: <fb303a78ecb0aa757a78bc896b2c3627093528d3.1484254064.git.baruch@tkos.co.il>
 <87vatjat58.fsf@dell.be.48ers.dk>
Message-ID: <20170114173527.gflazmfwaguwgdr5@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Fri, Jan 13, 2017 at 04:14:59PM +0100, Peter Korsgaard wrote:
> >>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:
> 
>  > Use upstream provided tarball.
>  > Upstream switched to cmake.
> 
>  > libjpeg dependency is now optional.
> 
>  > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> 
> Committed, thanks.
> 
> Did you verify that none of the reverse dependencies need the jpeg
> support?

I just build tested libraw, opencv, and opencv3. All built fine without 
BR2_PACKAGE_JPEG.

Kodi selects both BR2_PACKAGE_JASPER and BR2_PACKAGE_JPEG unconditionally, so 
it should not be affected by this change.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
