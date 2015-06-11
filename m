From: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
Date: Thu, 11 Jun 2015 17:00:56 -0400
Subject: [Buildroot] [PATCH v4 0/3] kyua: new package and dependencies
Message-ID: <1434056459-24075-1-git-send-email-sebastien.bourdelin@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patchset introduces the Kyua testing framework with its
dependencies.

https://github.com/jmmv/kyua

Sebastien Bourdelin (3):
  atf: new package
  lutok: new package
  kyua: new package

 package/Config.in       |  3 +++
 package/atf/Config.in   | 11 +++++++++++
 package/atf/atf.hash    |  2 ++
 package/atf/atf.mk      | 21 +++++++++++++++++++++
 package/kyua/Config.in  | 18 ++++++++++++++++++
 package/kyua/kyua.hash  |  2 ++
 package/kyua/kyua.mk    | 26 ++++++++++++++++++++++++++
 package/lutok/Config.in | 11 +++++++++++
 package/lutok/lutok.mk  | 19 +++++++++++++++++++
 9 files changed, 113 insertions(+)
 create mode 100644 package/atf/Config.in
 create mode 100644 package/atf/atf.hash
 create mode 100644 package/atf/atf.mk
 create mode 100644 package/kyua/Config.in
 create mode 100644 package/kyua/kyua.hash
 create mode 100644 package/kyua/kyua.mk
 create mode 100644 package/lutok/Config.in
 create mode 100644 package/lutok/lutok.mk

-- 
2.4.0
