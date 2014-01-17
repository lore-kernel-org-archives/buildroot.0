From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 17 Jan 2014 09:08:09 +0100
Subject: [Buildroot] [PATCH v2 01/12] libass: new package
In-Reply-To: <1389831355-19983-2-git-send-email-maxime.hadjinlian@gmail.com>
 (Maxime Hadjinlian's message of "Thu, 16 Jan 2014 01:15:44 +0100")
References: <1389831355-19983-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1389831355-19983-2-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <874n53owt2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Hadjinlian <maxime.hadjinlian@gmail.com> writes:

 > libass is a portable subtitle renderer for the
 > ASS/SSA (Advanced Substation Alpha/Substation Alpha) subtitle format.
 > This package was originally found at : https://github.com/huceke/buildroot-rbp
 > By gimli <ebsi4711@gmail.com>

 > Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
 > Cc: gimli <ebsi4711@gmail.com>
 > Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > ---
 > Changes v2 -> v3
 >   - Fix header
 > Changes v1 -> v2
 >   - Bump version to 0.10.2 (Bernd Kuhls)

 > +config BR2_PACKAGE_LIBASS
 > +	bool "libass"
 > +	select BR2_PACKAGE_FREETYPE
 > +	select BR2_PACKAGE_FONTCONFIG
 > +	select BR2_PACKAGE_LIBENCA

The patch ordering is wrong. You only introduce libenca in patch
11. Otherwise it looks OK.

-- 
Bye, Peter Korsgaard
