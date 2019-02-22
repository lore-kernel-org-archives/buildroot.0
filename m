From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Feb 2019 13:30:39 +0100
Subject: [Buildroot] [PATCH 1/3] package/imagemagick: fixup help text
 layout
In-Reply-To: <10082_1550582141_5C6C017D_10082_180_1_2ca105eb-cb6f-44fa-94bb-4a2ffe2b6507@OPEXCLILMA1.corporate.adroot.infra.ftgroup>
 (yann morin's message of "Tue, 19 Feb 2019 14:15:28 +0100")
References: <10082_1550582141_5C6C017D_10082_180_1_2ca105eb-cb6f-44fa-94bb-4a2ffe2b6507@OPEXCLILMA1.corporate.adroot.infra.ftgroup>
Message-ID: <87y368j98w.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>>   <yann.morin@orange.com> writes:

 > From: "Yann E. MORIN" <yann.morin@orange.com>
 > Signed-off-by: "Yann E. MORIN" <yann.morin@orange.com>
 > ---
 >  package/imagemagick/Config.in | 4 ++--
 >  1 file changed, 2 insertions(+), 2 deletions(-)

 > diff --git a/package/imagemagick/Config.in b/package/imagemagick/Config.in
 > index 4bd81dbd79..8b795d89e5 100644
 > --- a/package/imagemagick/Config.in
 > +++ b/package/imagemagick/Config.in
 > @@ -9,8 +9,8 @@ config BR2_PACKAGE_IMAGEMAGICK
 >  	  JPEG, JPEG-2000, PDF, PhotoCD, PNG, Postscript, SVG, and TIFF.
 >  	  Use ImageMagick to translate, flip, mirror, rotate, scale,
 >  	  shear and transform images, adjust image colors, apply various
 > -	  special effects, or draw text,
 > -	  lines, polygons, ellipses and B?zier curves.
 > +	  special effects, or draw text, lines, polygons, ellipses and
 > +	  B?zier curves.

Committed to 2018.02.x and 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
