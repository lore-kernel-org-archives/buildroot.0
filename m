From: Guillaume GARDET <guillaume.gardet@oliseo.fr>
Date: Wed, 12 Nov 2014 17:16:29 +0100
Subject: [Buildroot] [PATCH V2 0/4] Add ICAP server support
In-Reply-To: <1411032426-11463-1-git-send-email-guillaume.gardet@oliseo.fr>
References: <1411032426-11463-1-git-send-email-guillaume.gardet@oliseo.fr>
Message-ID: <1415808993-2394-1-git-send-email-guillaume.gardet@oliseo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

This patch series enable ICAP support in squid and add c-icap and c-icap-modules packages.

Comments done on V1 have been integrated.


Regards,

Guillaume

---

Guillaume GARDET (4):
  package/squid: define the log directory, pidfile and swapdir
  package/squid: enable ICAP server support in squid
  c-icap: new package
  c-icap-modules: new package

 package/Config.in                        |  2 ++
 package/c-icap-modules/Config.in         |  7 +++++++
 package/c-icap-modules/c-icap-modules.mk | 27 +++++++++++++++++++++++++++
 package/c-icap/Config.in                 | 10 ++++++++++
 package/c-icap/c-icap.mk                 | 27 +++++++++++++++++++++++++++
 package/squid/squid.mk                   | 12 ++++++++++--
 6 files changed, 83 insertions(+), 2 deletions(-)
 create mode 100644 package/c-icap-modules/Config.in
 create mode 100644 package/c-icap-modules/c-icap-modules.mk
 create mode 100644 package/c-icap/Config.in
 create mode 100644 package/c-icap/c-icap.mk

-- 
1.8.4.5
