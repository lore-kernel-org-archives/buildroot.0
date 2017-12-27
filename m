From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Dec 2017 10:55:20 +0100
Subject: [Buildroot] [PATCH 1/1] package/kodi-pvr-stalker: needs libxml2
In-Reply-To: <20171203182310.23780-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sun, 3 Dec 2017 19:23:10 +0100")
References: <20171203182310.23780-1-bernd.kuhls@t-online.de>
Message-ID: <87373wtrzr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Since
 > https://git.buildroot.net/buildroot/commit/package/kodi?id=bf9bfd065ba3fab328fd041ca040f2bf134fecf2
 > kodi itself does not depend on libxml2 anymore which previously
 > provided libxml2 still needed by kodi-pvr-stalker:
 > https://github.com/kodi-pvr/pvr.stalker/blob/Krypton/CMakeLists.txt#L12

 > Fixes a build error not caught by autobuilders because they do not have
 > host jdk installed:
 > CMake Error at /usr/share/cmake-3.7/Modules/FindPackageHandleStandardArgs.cmake:138 (message):
 >   Could NOT find LibXml2 (missing: LIBXML2_LIBRARIES LIBXML2_INCLUDE_DIR)

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2017.11.x, thanks.

-- 
Bye, Peter Korsgaard
