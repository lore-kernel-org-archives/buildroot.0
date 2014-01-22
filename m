From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 23 Jan 2014 00:49:39 +0100
Subject: [Buildroot] [PATCH v3 07/12] tinyxml: new package
In-Reply-To: <1390165448-9130-8-git-send-email-maxime.hadjinlian@gmail.com>
 (Maxime Hadjinlian's message of "Sun, 19 Jan 2014 22:04:03 +0100")
References: <1390165448-9130-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1390165448-9130-8-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <87y527bmr0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Hadjinlian <maxime.hadjinlian@gmail.com> writes:

 > Tiny XML Parser.
 > This package was originally found at : https://github.com/huceke/buildroot-rbp
 > By gimli <ebsi4711@gmail.com>

 > Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
 > Cc: gimli <ebsi4711@gmail.com>
 > ---
 > Changes v2 -> v3:
 >   - Fix indent (Yann E. Morin)
 > Changes v1 -> v2:
 >   - Fix header (Yann E. Morin)
 >   - Fix comment on toolchain option (Peter Korsgaard)
 > ---
 > +################################################################################
 > +#
 > +# tinyxml
 > +#
 > +################################################################################
 > +
 > +TINYXML_VERSION = 2.6.2_2
 > +TINYXML_SITE = http://mirrors.xbmc.org/build-deps/sources
 > +# AUTORECONF is needed because the XBMC's version of TinyXML contains a
 > +# configure.ac which is not present in mainline.
 > +TINYXML_AUTORECONF = YES
 > +TINYXML_INSTALL_STAGING = YES
 > +TINYXML_LICENSE = zlib

It's missing a LICENSE_FILES tag (to README).

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
