From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue, 14 Apr 2015 17:05:02 +0200
Subject: [Buildroot] [PATCH v3 0/2]  Web2py and pydal new packages
Message-ID: <1429023904-20194-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds web2py python web application framework and pydal,
it's database abstraction layer.
This is the first package to use the new recursive makedevs syntax,
indeed it runs as www-data non privileged user.

Angelo Compagnucci (2):
  package/python-pydal: new package
  package/python-web2py: new package

 package/Config.in                      |  2 ++
 package/python-pydal/Config.in         | 15 +++++++++++++
 package/python-pydal/python-pydal.mk   | 14 ++++++++++++
 package/python-web2py/Config.in        | 23 ++++++++++++++++++++
 package/python-web2py/S51web2py        | 25 ++++++++++++++++++++++
 package/python-web2py/python-web2py.mk | 39 ++++++++++++++++++++++++++++++++++
 package/python-web2py/web2py.service   | 11 ++++++++++
 7 files changed, 129 insertions(+)
 create mode 100644 package/python-pydal/Config.in
 create mode 100644 package/python-pydal/python-pydal.mk
 create mode 100644 package/python-web2py/Config.in
 create mode 100644 package/python-web2py/S51web2py
 create mode 100644 package/python-web2py/python-web2py.mk
 create mode 100644 package/python-web2py/web2py.service

-- 
1.9.1
