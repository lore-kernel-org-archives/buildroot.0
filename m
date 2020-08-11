From: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
Date: Tue, 11 Aug 2020 20:37:43 +0200
Subject: [Buildroot] [PATCH 0/1] Ettercap tools suite
Message-ID: <1597171064-13491-1-git-send-email-jugurtha.belkalem@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ettercap is a comprehensive suite for man
in the middle attacks. It integrates various security
functionalities like sniffing live connections, content
filtering on the fly and arp poisoning.

Ettercap can help identify misconfigured networks,
testing intrusion detection and prevention
applications and build robust embedded systems that
are security by design compliant.

Jugurtha BELKALEM (1):
  package/ettercap: new package

 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 .../0001-Fix-invalid-utf-8-is-not-supported.patch  | 31 ++++++++++++++++++++++
 package/ettercap/Config.in                         | 24 +++++++++++++++++
 package/ettercap/ettercap.hash                     |  3 +++
 package/ettercap/ettercap.mk                       | 15 +++++++++++
 6 files changed, 75 insertions(+)
 create mode 100644 package/ettercap/0001-Fix-invalid-utf-8-is-not-supported.patch
 create mode 100644 package/ettercap/Config.in
 create mode 100644 package/ettercap/ettercap.hash
 create mode 100644 package/ettercap/ettercap.mk

-- 
2.7.4
