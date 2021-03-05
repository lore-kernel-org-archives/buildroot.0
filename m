From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 05 Mar 2021 22:32:32 +0100
Subject: [Buildroot] [PATCH 1/1] package/sdl2_image: add
 SDL2_IMAGE_CPE_ID_PRODUCT
In-Reply-To: <20210305151454.2008432-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 5 Mar 2021 16:14:54 +0100")
References: <20210305151454.2008432-1-fontaine.fabrice@gmail.com>
Message-ID: <871rctcmmn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > cpe:2.3:a:libsdl:sdl_image is a valid CPE identifier for this package:
 >   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibsdl%3Asdl2_image

 > Indeed, cpe:2.3:a:libsdl:sdl2_image contains a single CPE entry for
 > version 2.0.4, all the other entries have been deprecated in favor of
 > cpe:2.3:a:libsdl:sdl_image:

 >   <cpe-item name="cpe:/a:libsdl:sdl2_image:2.0.3" deprecated="true" deprecation_date="2020-07-28T15:42:37.767Z">
 >       <reference href="https://www.libsdl.org/projects/SDL_image/">Product</reference>
 >     <cpe-23:cpe23-item name="cpe:2.3:a:libsdl:sdl2_image:2.0.3:*:*:*:*:*:*:*">
 >         <cpe-23:deprecated-by name="cpe:2.3:a:libsdl:sdl_image:2.0.3:*:*:*:*:*:*:*" type="NAME_CORRECTION"/>
 >   <cpe-item name="cpe:/a:libsdl:sdl2_image:2.0.4">
 >       <reference href="http://hg.libsdl.org/SDL_image/">Version</reference>
 >     <cpe-23:cpe23-item name="cpe:2.3:a:libsdl:sdl2_image:2.0.4:*:*:*:*:*:*:*"/>
 >   <cpe-item name="cpe:/a:libsdl:sdl2_image:2.0.5" deprecated="true" deprecation_date="2020-07-28T15:42:40.500Z">
 >       <reference href="http://hg.libsdl.org/SDL_image/">Version</reference>
 >     <cpe-23:cpe23-item name="cpe:2.3:a:libsdl:sdl2_image:2.0.5:*:*:*:*:*:*:*">
 >         <cpe-23:deprecated-by name="cpe:2.3:a:libsdl:sdl_image:2.0.5:*:*:*:*:*:*:*" type="NAME_CORRECTION"/>:

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
