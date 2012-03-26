From: Marek Belisko <marek.belisko@open-nandra.com>
Date: Mon, 26 Mar 2012 22:12:33 +0200
Subject: [Buildroot] [PATCH v2 0/3] Add ofono package + dependency libraries
Message-ID: <1332792756-3381-1-git-send-email-marek.belisko@open-nandra.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Following patches add ofono package + new libcap-ng and broadband mobile
provider info packages. Ofono bluetooth support is optional and 
selectable via config.

Marek Belisko (3):
  Add libcap-ng package.
  Add mobile-broadband-provider-info package.
  Add ofono package.

 package/Config.in                                  |    3 ++
 package/libcap-ng/Config.in                        |   10 ++++++++
 package/libcap-ng/libcap-ng.mk                     |   12 +++++++++
 package/mobile-broadband-provider-info/Config.in   |    6 ++++
 .../mobile_broadband_provider_info.mk              |   14 +++++++++++
 package/ofono/Config.in                            |   20 ++++++++++++++++
 package/ofono/ofono.mk                             |   25 ++++++++++++++++++++
 7 files changed, 90 insertions(+), 0 deletions(-)
 create mode 100644 package/libcap-ng/Config.in
 create mode 100644 package/libcap-ng/libcap-ng.mk
 create mode 100644 package/mobile-broadband-provider-info/Config.in
 create mode 100644 package/mobile-broadband-provider-info/mobile_broadband_provider_info.mk
 create mode 100644 package/ofono/Config.in
 create mode 100644 package/ofono/ofono.mk

-- 
1.7.5.4
