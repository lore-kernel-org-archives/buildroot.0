From: David Bachelart <david.bachelart@bbright.com>
Date: Fri, 11 Jul 2014 15:55:59 +0200
Subject: [Buildroot] [PATCH 0/1] License issue about dbus-python
Message-ID: <1405086960-14881-1-git-send-email-david.bachelart@bbright.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I would like to add dbus-python package to buildroot. I'm no license 
expert, and I do not know how I can fill the license field in the 
makefile. The COPYING file does not clearly give a license name.

Regards,

David Bachelart (1):
  python-dbus: new package

 package/Config.in                  |    1 +
 package/python-dbus/Config.in      |   17 +++++++++++++++++
 package/python-dbus/python-dbus.mk |   16 ++++++++++++++++
 3 files changed, 34 insertions(+)
 create mode 100644 package/python-dbus/Config.in
 create mode 100644 package/python-dbus/python-dbus.mk

-- 
1.7.10.4
