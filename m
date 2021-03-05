From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 05 Mar 2021 22:52:23 +0100
Subject: [Buildroot] [PATCH 1/1] package/sdl2: update SDL2_CPE_ID_PRODUCT
In-Reply-To: <20210305153253.2009635-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 5 Mar 2021 16:32:53 +0100")
References: <20210305153253.2009635-1-fontaine.fabrice@gmail.com>
Message-ID: <87sg59b754.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > libsdl:sdl has been replaced by libsdl:simple_directmedia_layer:
 >   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibsdl%3Asimple_directmedia_layer

 >   <cpe-item name="cpe:/a:libsdl:sdl:2.0.12" deprecated="true" deprecation_date="2021-02-08T18:56:07.243Z">
 >       <reference href="https://www.libsdl.org/release/">Version</reference>
 >     <cpe-23:cpe23-item name="cpe:2.3:a:libsdl:sdl:2.0.12:*:*:*:*:*:*:*">
 >         <cpe-23:deprecated-by name="cpe:2.3:a:libsdl:simple_directmedia_layer:2.0.12:*:*:*:*:*:*:*" type="NAME_CORRECTION"/>

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
