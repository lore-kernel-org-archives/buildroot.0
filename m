From: Hebbar <gururajakr@sanyo.co.in>
Date: Thu, 2 Aug 2007 01:59:26 -0700 (PDT)
Subject: [Buildroot] fontconfig dependency on expat/libxml2
Message-ID: <11960871.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi All,

 In fontconfig.mk file i noticed that "make fontconfig" depends on expat to
be precompilled. what if user has selected libxml2 instead of expat. So when
we just give make , fontconfig build 1st & fails asking for xml related
files. so then user have to build libxml2 manually by giving "make libxml2"
& then give "make fontconfig". so is it possible to change fontconfig.mk
file to check for preselected xml parser option(expat/libxml) & build
accordingly

at present fontconfig.mk -->
 fontconfig: uclibc freetype host-freetype expat
$(TARGET_DIR)/usr/lib/libfontconfig.so

Regards
Gururaja
-- 
View this message in context: http://www.nabble.com/fontconfig-dependency-on-expat-libxml2-tf4204952.html#a11960871
Sent from the BuildRoot mailing list archive at Nabble.com.
