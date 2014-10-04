From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  4 Oct 2014 18:11:18 +0200
Subject: [Buildroot] [RFC 0/3] package/kodi: Bump version to 14.0a4-Helix
Message-ID: <1412439081-2975-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

this patchset is a RFC and not meant to be committed to buildroot git.

The follow-up version of XBMC 13.x-Gotham will be called Kodi, its alpha4 was
released yesterday: http://xbmc.org/kodi-14-0-helix-alpha-4

In order to prepare this version bump I am sharing my patchset as an RFC, two
preparatory patches to rename the package, and to keep bisectability, and one
patch for the real version bump.

Regards, Bernd


Bernd Kuhls (3):
  Rename XBMC to Kodi - part I - move files
  Rename XBMC to Kodi - part II - rename variables
  package/kodi: Bump version to 14.0a4-Helix

 package/ffmpeg/ffmpeg-0001-fminf.patch          |   47 +++++++++
 package/openssl/openssl.mk                      |    2 -
 package/uclibc/0.9.33.2/uclibc-0063-fminf.patch |  127 -----------------------
 3 files changed, 47 insertions(+), 129 deletions(-)
 create mode 100644 package/ffmpeg/ffmpeg-0001-fminf.patch
 delete mode 100644 package/uclibc/0.9.33.2/uclibc-0063-fminf.patch

-- 
1.7.10.4
