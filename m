From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 28 Jan 2014 20:17:22 +0100
Subject: [Buildroot] [PATCH v4 3/5] libenca: new package
In-Reply-To: <1390772341-6790-4-git-send-email-maxime.hadjinlian@gmail.com>
 (Maxime Hadjinlian's message of "Sun, 26 Jan 2014 22:38:59 +0100")
References: <1390772341-6790-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1390772341-6790-4-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <87mwif3ohp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Hadjinlian <maxime.hadjinlian@gmail.com> writes:

 > Extremely Naive Charset Analyser.
 > This package was originally found at : https://github.com/huceke/buildroot-rbp
 > By gimli <ebsi4711@gmail.com>

 > Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
 > Cc: gimli <ebsi4711@gmail.com>
 > Cc: Bernd Kuhls <berndkuhls@hotmail.com>
 > ---
 > Changes v3 --> v4:
 >   - Add support for libiconv (Patch from Bernd Kuhls)
 > Changes v2 --> v3:
 >   - Bump libenca to 1.15 (1.9 was 4 years ago)
 >   - Rework the whole libenca.mk file
 >   - Switch source to github
 >   - New patch against Makefile.am and do AUTORECONF (Thomas Petazzoni,
 >     Yann E. Morin)
 >   - Remove the uses of prefix by adding a patch which removes a hack in
 >     the configure.ac (Yann E. Morin)
 > Changes v1 --> v2:
 >   - Rename patch files (Thomas Petazzoni)
 >   - Fix header of the mk files (Thomas Petazzoni)
 >   - Fix indent (Thomas Petazzoni)
 >   - Put LIBENCA_CONF_ENV on one line (Thomas Petazzoni)
 > ---
 >  package/Config.in                                  |  1 +
 >  package/libenca/Config.in                          |  7 ++++
 >  .../libenca/libenca-000-do-not-build-tools.patch   | 44 ++++++++++++++++++++++
 >  .../libenca-001-fix-installation-error.patch       | 44 ++++++++++++++++++++++
 >  ...benca-002-remove-prefix-hack-in-configure.patch | 33 ++++++++++++++++
 >  package/libenca/libenca-003-iconv.patch            | 15 ++++++++

Oh and plese don't forget to send the patches upstream!

-- 
Bye, Peter Korsgaard
