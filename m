From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Nov 2018 22:07:43 +0100
Subject: [Buildroot] [PATCH 1/1] qt: disable static build for qt-zlib
In-Reply-To: <20181108192829.17014-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 8 Nov 2018 20:28:29 +0100")
References: <20181108192829.17014-1-fontaine.fabrice@gmail.com>
Message-ID: <87a7lw50io.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Static build of applications using qt-zlib and zlib (such as mpv) will
 > fail because zlib and qt-zlib defines the same functions (inflateReset,
 > inflatePrime ...)

 > So add a dependency on !BR2_STATIC_LIBS on BR2_PACKAGE_QT_QTZLIB

 > Fixes:
 >  - http://autobuild.buildroot.org/results/0be6e359d46a8a701006305c32b514687854b035

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2018.02.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
