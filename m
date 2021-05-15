From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 May 2021 08:50:46 +0200
Subject: [Buildroot] [PATCH/next 2/2] package/libbluray: bump version to
 1.3.0
In-Reply-To: <20210513070536.1021065-2-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Thu, 13 May 2021 09:05:36 +0200")
References: <20210513070536.1021065-1-bernd.kuhls@t-online.de>
 <20210513070536.1021065-2-bernd.kuhls@t-online.de>
Message-ID: <87y2cgo5h5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Removed backported patch.
 > Changelog:
 > https://code.videolan.org/videolan/libbluray/-/blob/master/ChangeLog

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > ---
 >  package/libbluray/0001-libudfread.patch | 32 -------------------------

We don't have this patch in git, so the patch does not apply as is. I've
fixed that up and applied (to next).

 > @@ -12,8 +12,6 @@ LIBBLURAY_LICENSE = LGPL-2.1+
 >  LIBBLURAY_LICENSE_FILES = COPYING
 >  LIBBLURAY_CPE_ID_VENDOR = videolan
 >  LIBBLURAY_DEPENDENCIES = host-pkgconf
 > -# 0001-libudfread.patch
 > -LIBBLURAY_AUTORECONF = YES
 
 >  LIBBLURAY_CONF_OPTS = --disable-bdjava-jar

I've naturally also dropped this hunk.

-- 
Bye, Peter Korsgaard
