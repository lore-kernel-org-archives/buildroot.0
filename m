From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 21 Oct 2018 19:16:09 +0200
Subject: [Buildroot] [PATCH v5 2/2] core/legal-info: Add package
 dependencies with licenses to the manifest
In-Reply-To: <20181021115924.29838-2-luca@lucaceresoli.net> (Luca Ceresoli's
 message of "Sun, 21 Oct 2018 12:59:24 +0100")
References: <20181021115924.29838-1-luca@lucaceresoli.net>
 <20181021115924.29838-2-luca@lucaceresoli.net>
Message-ID: <87k1mb5ig6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Luca" == Luca Ceresoli <luca@lucaceresoli.net> writes:

 > From: Michal Sojka <sojka@merica.cz>
 > This adds one column to the legal-info manifest table. It contains the
 > dependencies of the given package and their licenses. This information
 > is useful when assessing license compatibility of the packages and
 > their libraries.

 > An example of the content of the new column for the MPD package is
 > shown below:

 >     "alsa-lib [LGPL-2.1+ (library), GPL-2.0+ (aserver)] boost
 >     [BSL-1.0] libid3tag [GPL-2.0+] libmad [GPL-2.0+] libogg
 >     [BSD-3-Clause] libvorbis [BSD-3-Clause] libzlib [Zlib]
 >     skeleton-init-common [unknown] skeleton-init-sysv [unknown] sqlite
 >     [Public domain] toolchain-external-linaro-arm [unknown]"

Should this be documented somewhere in the manual?

 > [Credits to Yann E. MORIN <yann.morin.1998@free.fr> for suggesting a
 > few simplifications.]

 > Signed-off-by: Michal Sojka <sojka@merica.cz>
 > Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
 > Tested-by: Luca Ceresoli <luca@lucaceresoli.net>

 > ---

 > Changes v4 -> v5:
 > - rebased fixing trivial, unrelated conflict
 > - add Luca's review tags

Committed, thanks.

-- 
Bye, Peter Korsgaard
