From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 21 Apr 2021 15:42:25 -0500
Subject: [Buildroot] [PATCH 00/10] Misc CVE ignores
Message-ID: <20210421204235.5956-1-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 * I'm working on upstream NVD fixes for some of these.

 * There are roughly half of the ignore cases that are a bit of a
   challenge to identify where the fix was clearly tracked into
   a specific version. I tried to document in each commit as much
   as a could by linking to conversations clarifying the details.

Matt Weber (10):
  package/bind: ignore CVE-2017-3139
  package/coreutils: ignore CVE-2013-0221, CVE-2013-0222, CVE-2013-0223
  package/bind: ignore CVE-2019-6470
  package/cmake: ignore CVE-2016-10642
  package/flex: ignore CVE-2019-6293
  package/hostapd: ignore CVE-2021-30004 when using openssl
  package/wpa_supplicant: ignore CVE-2021-30004 when using openssl
  package/ncurses: ignore CVE-2018-10754, CVE-2018-19211,
    CVE-2018-19217, CVE-2019-17594, CVE-2019-17595
  package/rsyslog: ignore CVE-2015-3243
  package/tar: ignore CVE-2007-4476

 package/bind/bind.mk                     | 4 ++++
 package/cmake/cmake.mk                   | 2 ++
 package/coreutils/coreutils.mk           | 4 ++++
 package/flex/flex.mk                     | 3 +++
 package/hostapd/hostapd.mk               | 2 ++
 package/ncurses/ncurses.mk               | 6 ++++++
 package/rsyslog/rsyslog.mk               | 4 ++++
 package/tar/tar.mk                       | 2 ++
 package/wpa_supplicant/wpa_supplicant.mk | 2 ++
 9 files changed, 29 insertions(+)

-- 
2.17.1
