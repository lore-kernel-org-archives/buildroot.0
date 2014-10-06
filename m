From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  6 Oct 2014 22:47:59 +0200
Subject: [Buildroot] [RFC/PATCH v2 0/4] package/kodi: Bump version to
	14.0a4-Helix
Message-ID: <1412628483-23641-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

this patchset is a RFC and not meant to be committed to buildroot git yet.

The follow-up version of XBMC 13.x-Gotham will be called Kodi, its alpha4 was
released October 3rd: http://xbmc.org/kodi-14-0-helix-alpha-4

In order to prepare this version bump I am sharing my patchset as an RFC, two
preparatory patches to rename the package, splitted for easier review, and one
patch for the real version bump.

Regards, Bernd

v2:
- rebased: - _CONF_OPT -> _CONF_OPTS
- added notes to "Rename XBMC to Kodi"-patches, they are meant to be committed
  together (Yann)
- kodi specific ffmpeg-patches are now a seperate commit (Yann),
  depends on http://patchwork.ozlabs.org/patch/396911/
- ffmpeg is now compiled dynamically, ported from
  https://github.com/OpenELEC/OpenELEC.tv/commit/ba586280


Bernd Kuhls (4):
  package/ffmpeg: Add Kodi patchset
  Rename XBMC to Kodi - part I - move files
  Rename XBMC to Kodi - part II - rename variables
  package/kodi: Bump version to 14.0a4-Helix

-- 
1.7.10.4
