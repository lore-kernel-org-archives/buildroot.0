From: Marek Belisko <marek.belisko@open-nandra.com>
Date: Sun,  1 Apr 2012 15:58:46 +0200
Subject: [Buildroot] [PATCH v3 0/3] Add ofono package + dependency libraries
Message-ID: <1333288729-22138-1-git-send-email-marek.belisko@open-nandra.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changes from V2:
- libcap-ng : remove LIBCAP_NG_SOURCE
- mobile-broadband-provider-info : use revision name instead master to track
  problems in particular revision
- ofono : add dependency to BR2_USE_WCHAR
	: change package description
        : fix whitespace
	: change ofono site to kernel mirror instead git

Marek Belisko (3):
  Add libcap-ng package.
  Add mobile-broadband-provider-info package.
  Add ofono package.

 package/Config.in                                  |    3 ++
 package/libcap-ng/Config.in                        |   10 ++++++
 package/libcap-ng/libcap-ng.mk                     |   11 +++++++
 package/mobile-broadband-provider-info/Config.in   |    6 ++++
 .../mobile_broadband_provider_info.mk              |   14 +++++++++
 package/ofono/Config.in                            |   23 +++++++++++++++
 package/ofono/ofono.mk                             |   30 ++++++++++++++++++++
 7 files changed, 97 insertions(+), 0 deletions(-)
 create mode 100644 package/libcap-ng/Config.in
 create mode 100644 package/libcap-ng/libcap-ng.mk
 create mode 100644 package/mobile-broadband-provider-info/Config.in
 create mode 100644 package/mobile-broadband-provider-info/mobile_broadband_provider_info.mk
 create mode 100644 package/ofono/Config.in
 create mode 100644 package/ofono/ofono.mk

-- 
1.7.5.4
