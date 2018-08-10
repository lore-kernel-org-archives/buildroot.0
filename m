From: Christopher McCrory <chrismcc@gmail.com>
Date: Fri, 10 Aug 2018 09:14:44 -0700
Subject: [Buildroot] [PATCH 00/18] more perl modules
Message-ID: <20180810161502.21598-1-chrismcc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am working on packaging ZoneMinder into buildroot. It requires a
number of perl packages.  This first series is some of the perl bits
that do not have any dependancies, nor need any tweeks.

All were generated with the awesome scancpan script



Christopher McCrory (18):
  perl-appconfig: new package
  perl-astro-suntime: new package
  perl-cgi: new package
  perl-class-std: new package
  perl-data-uuid: new package
  perl-date-manip: new package
  perl-dbi: new package
  perl-device-serialport: new package
  perl-file-slurp: new package
  perl-io-interface: new package
  perl-json-maybexs: new package
  perl-module-runtime: new package
  perl-number-bytes-human: new package
  perl-params-util: new package
  perl-sub-install: new package
  perl-sys-meminfo: new package
  perl-sys-mmap: new package
  Add to DEVELOPERS file

 DEVELOPERS                                            | 19 +++++++++++++++++++
 package/Config.in                                     | 17 +++++++++++++++++
 package/perl-appconfig/Config.in                      |  6 ++++++
 package/perl-appconfig/perl-appconfig.hash            |  6 ++++++
 package/perl-appconfig/perl-appconfig.mk              | 13 +++++++++++++
 package/perl-astro-suntime/Config.in                  |  6 ++++++
 package/perl-astro-suntime/perl-astro-suntime.hash    |  6 ++++++
 package/perl-astro-suntime/perl-astro-suntime.mk      | 14 ++++++++++++++
 package/perl-cgi/Config.in                            | 11 +++++++++++
 package/perl-cgi/perl-cgi.hash                        |  6 ++++++
 package/perl-cgi/perl-cgi.mk                          | 14 ++++++++++++++
 package/perl-class-std/Config.in                      |  6 ++++++
 package/perl-class-std/perl-class-std.hash            |  6 ++++++
 package/perl-class-std/perl-class-std.mk              | 14 ++++++++++++++
 package/perl-data-uuid/Config.in                      | 10 ++++++++++
 package/perl-data-uuid/perl-data-uuid.hash            |  6 ++++++
 package/perl-data-uuid/perl-data-uuid.mk              | 13 +++++++++++++
 package/perl-date-manip/Config.in                     |  6 ++++++
 package/perl-date-manip/perl-date-manip.hash          |  6 ++++++
 package/perl-date-manip/perl-date-manip.mk            | 13 +++++++++++++
 package/perl-dbi/Config.in                            | 10 ++++++++++
 package/perl-dbi/perl-dbi.hash                        |  6 ++++++
 package/perl-dbi/perl-dbi.mk                          | 13 +++++++++++++
 package/perl-device-serialport/Config.in              | 10 ++++++++++
 .../perl-device-serialport.hash                       |  6 ++++++
 .../perl-device-serialport/perl-device-serialport.mk  | 12 ++++++++++++
 package/perl-file-slurp/Config.in                     |  6 ++++++
 package/perl-file-slurp/perl-file-slurp.hash          |  6 ++++++
 package/perl-file-slurp/perl-file-slurp.mk            | 13 +++++++++++++
 package/perl-io-interface/Config.in                   | 10 ++++++++++
 package/perl-io-interface/perl-io-interface.hash      |  6 ++++++
 package/perl-io-interface/perl-io-interface.mk        | 14 ++++++++++++++
 package/perl-json-maybexs/Config.in                   |  6 ++++++
 package/perl-json-maybexs/perl-json-maybexs.hash      |  6 ++++++
 package/perl-json-maybexs/perl-json-maybexs.mk        | 13 +++++++++++++
 package/perl-module-runtime/Config.in                 |  6 ++++++
 package/perl-module-runtime/perl-module-runtime.hash  |  6 ++++++
 package/perl-module-runtime/perl-module-runtime.mk    | 14 ++++++++++++++
 package/perl-number-bytes-human/Config.in             |  6 ++++++
 .../perl-number-bytes-human.hash                      |  6 ++++++
 .../perl-number-bytes-human.mk                        | 13 +++++++++++++
 package/perl-params-util/Config.in                    | 10 ++++++++++
 package/perl-params-util/perl-params-util.hash        |  6 ++++++
 package/perl-params-util/perl-params-util.mk          | 13 +++++++++++++
 package/perl-sub-install/Config.in                    |  6 ++++++
 package/perl-sub-install/perl-sub-install.hash        |  6 ++++++
 package/perl-sub-install/perl-sub-install.mk          | 13 +++++++++++++
 package/perl-sys-meminfo/Config.in                    | 10 ++++++++++
 package/perl-sys-meminfo/perl-sys-meminfo.hash        |  6 ++++++
 package/perl-sys-meminfo/perl-sys-meminfo.mk          | 12 ++++++++++++
 package/perl-sys-mmap/Config.in                       | 10 ++++++++++
 package/perl-sys-mmap/perl-sys-mmap.hash              |  7 +++++++
 package/perl-sys-mmap/perl-sys-mmap.mk                | 13 +++++++++++++
 53 files changed, 498 insertions(+)
 create mode 100644 package/perl-appconfig/Config.in
 create mode 100644 package/perl-appconfig/perl-appconfig.hash
 create mode 100644 package/perl-appconfig/perl-appconfig.mk
 create mode 100644 package/perl-astro-suntime/Config.in
 create mode 100644 package/perl-astro-suntime/perl-astro-suntime.hash
 create mode 100644 package/perl-astro-suntime/perl-astro-suntime.mk
 create mode 100644 package/perl-cgi/Config.in
 create mode 100644 package/perl-cgi/perl-cgi.hash
 create mode 100644 package/perl-cgi/perl-cgi.mk
 create mode 100644 package/perl-class-std/Config.in
 create mode 100644 package/perl-class-std/perl-class-std.hash
 create mode 100644 package/perl-class-std/perl-class-std.mk
 create mode 100644 package/perl-data-uuid/Config.in
 create mode 100644 package/perl-data-uuid/perl-data-uuid.hash
 create mode 100644 package/perl-data-uuid/perl-data-uuid.mk
 create mode 100644 package/perl-date-manip/Config.in
 create mode 100644 package/perl-date-manip/perl-date-manip.hash
 create mode 100644 package/perl-date-manip/perl-date-manip.mk
 create mode 100644 package/perl-dbi/Config.in
 create mode 100644 package/perl-dbi/perl-dbi.hash
 create mode 100644 package/perl-dbi/perl-dbi.mk
 create mode 100644 package/perl-device-serialport/Config.in
 create mode 100644 package/perl-device-serialport/perl-device-serialport.hash
 create mode 100644 package/perl-device-serialport/perl-device-serialport.mk
 create mode 100644 package/perl-file-slurp/Config.in
 create mode 100644 package/perl-file-slurp/perl-file-slurp.hash
 create mode 100644 package/perl-file-slurp/perl-file-slurp.mk
 create mode 100644 package/perl-io-interface/Config.in
 create mode 100644 package/perl-io-interface/perl-io-interface.hash
 create mode 100644 package/perl-io-interface/perl-io-interface.mk
 create mode 100644 package/perl-json-maybexs/Config.in
 create mode 100644 package/perl-json-maybexs/perl-json-maybexs.hash
 create mode 100644 package/perl-json-maybexs/perl-json-maybexs.mk
 create mode 100644 package/perl-module-runtime/Config.in
 create mode 100644 package/perl-module-runtime/perl-module-runtime.hash
 create mode 100644 package/perl-module-runtime/perl-module-runtime.mk
 create mode 100644 package/perl-number-bytes-human/Config.in
 create mode 100644 package/perl-number-bytes-human/perl-number-bytes-human.hash
 create mode 100644 package/perl-number-bytes-human/perl-number-bytes-human.mk
 create mode 100644 package/perl-params-util/Config.in
 create mode 100644 package/perl-params-util/perl-params-util.hash
 create mode 100644 package/perl-params-util/perl-params-util.mk
 create mode 100644 package/perl-sub-install/Config.in
 create mode 100644 package/perl-sub-install/perl-sub-install.hash
 create mode 100644 package/perl-sub-install/perl-sub-install.mk
 create mode 100644 package/perl-sys-meminfo/Config.in
 create mode 100644 package/perl-sys-meminfo/perl-sys-meminfo.hash
 create mode 100644 package/perl-sys-meminfo/perl-sys-meminfo.mk
 create mode 100644 package/perl-sys-mmap/Config.in
 create mode 100644 package/perl-sys-mmap/perl-sys-mmap.hash
 create mode 100644 package/perl-sys-mmap/perl-sys-mmap.mk

-- 
2.14.4
