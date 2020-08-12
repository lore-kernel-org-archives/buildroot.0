From: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
Date: Wed, 12 Aug 2020 12:16:31 +0200
Subject: [Buildroot] [PATCH 0/1] package/ettercap: new package
Message-ID: <1597227392-9101-1-git-send-email-jugurtha.belkalem@smile.fr>
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
-------------------------------------------

v3
- Fix for ISO-8859-1 to utf-8 invalid conversion.
- Adding missing host dependencies that fail to compile
  on some architectures.
v2
- Bump to ettercap version 0.8.3.1.
- Adding missing toolchain required dependencies.

Jugurtha BELKALEM (1):
  package/ettercap: new package

 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/ettercap/Config.in     | 32 ++++++++++++++++++++++++++++++++
 package/ettercap/ettercap.hash |  3 +++
 package/ettercap/ettercap.mk   | 32 ++++++++++++++++++++++++++++++++
 5 files changed, 69 insertions(+)
 create mode 100644 package/ettercap/Config.in
 create mode 100644 package/ettercap/ettercap.hash
 create mode 100644 package/ettercap/ettercap.mk

-- 
2.7.4
