From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 31 Jan 2016 14:58:52 +0100
Subject: [Buildroot] [PATCH 0/6] Bump sigrok packages
Message-ID: <1454248738-12371-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

this small series bumps the packages from the sigrok project:
https://www.sigrok.org/blog/major-sigrok-releases-libsigrok-libsigrokdecode-sigrok-cli-pulseview

All packages now use upstream tarballs, no need for autoreconf anymore :)

Regards, Bernd

Bernd Kuhls (6):
  package/libserialport: bump version to 0.1.1
  package/libsigrok: bump version to 0.4.0
  package/libsigrok: fix musl build
  package/libsigrokdecode: bump version to 0.4.0
  package/sigrok-cli: bump version to 0.6.0
  package/pulseview: bump version to 0.3.0

 package/libserialport/libserialport.hash           |  2 ++
 package/libserialport/libserialport.mk             | 13 ++------
 ...01-beaglelogic.h-fix-build-with-musl-libc.patch | 38 ++++++++++++++++++++++
 package/libsigrok/libsigrok.hash                   |  2 ++
 package/libsigrok/libsigrok.mk                     | 13 ++------
 package/libsigrokdecode/Config.in                  |  2 +-
 package/libsigrokdecode/libsigrokdecode.hash       |  2 ++
 package/libsigrokdecode/libsigrokdecode.mk         | 13 ++------
 package/pulseview/pulseview.hash                   |  3 ++
 package/pulseview/pulseview.mk                     | 15 +++++++--
 package/sigrok-cli/sigrok-cli.hash                 |  2 ++
 package/sigrok-cli/sigrok-cli.mk                   | 13 ++------
 12 files changed, 70 insertions(+), 48 deletions(-)
 create mode 100644 package/libserialport/libserialport.hash
 create mode 100644 package/libsigrok/0001-beaglelogic.h-fix-build-with-musl-libc.patch
 create mode 100644 package/libsigrok/libsigrok.hash
 create mode 100644 package/libsigrokdecode/libsigrokdecode.hash
 create mode 100644 package/pulseview/pulseview.hash
 create mode 100644 package/sigrok-cli/sigrok-cli.hash

-- 
2.7.0
