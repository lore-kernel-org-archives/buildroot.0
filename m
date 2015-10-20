From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 20 Oct 2015 21:42:16 +0200
Subject: [Buildroot] [PATCH 00/10] package/kodi: bump version to
	15.2-Isengard
Message-ID: <1445370146-12033-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

this series bumps Kodi Isengard and some addons.

I added a hash file to kodi itself but not to the addons yet according
to http://thread.gmane.org/gmane.comp.lib.uclibc.buildroot/129717

"We can wait to gain a bit of knowledge/experience using the hashes on
 newly added packages (or existing packages when they are bumped)"

I am already preparing a patch series to bump Kodi to 16.0-Jarvis where
all addons are bumped again. This series will contain hash files for all
subpackages. I hope this is ok for you.

Regards, Bernd

Bernd Kuhls (10):
  package/kodi-audioencoder-flac: bump version
  package/kodi-pvr-argustv: bump version
  package/kodi-pvr-filmon: bump version
  package/kodi-pvr-hts: bump version
  package/kodi-pvr-mythtv: bump version
  package/kodi-pvr-stalker: bump version
  package/kodi-pvr-vbox: bump version
  package/kodi-pvr-pctv: bump version
  package/kodi: bump version to 15.2-Isengard
  package/kodi: Add support for libssh

 package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk |  2 +-
 package/kodi-pvr-argustv/kodi-pvr-argustv.mk             |  2 +-
 package/kodi-pvr-filmon/kodi-pvr-filmon.mk               |  2 +-
 package/kodi-pvr-hts/kodi-pvr-hts.mk                     |  2 +-
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk               |  2 +-
 package/kodi-pvr-pctv/kodi-pvr-pctv.mk                   |  2 +-
 package/kodi-pvr-stalker/kodi-pvr-stalker.mk             |  2 +-
 package/kodi-pvr-vbox/kodi-pvr-vbox.mk                   |  2 +-
 package/kodi/Config.in                                   |  6 ++++++
 package/kodi/kodi.mk                                     | 10 ++++++++--
 10 files changed, 22 insertions(+), 10 deletions(-)

-- 
2.6.1
