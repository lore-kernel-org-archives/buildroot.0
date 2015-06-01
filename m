From: Denis THULIN <denis.thulin@openwide.fr>
Date: Mon,  1 Jun 2015 16:56:06 +0200
Subject: [Buildroot] [PATCH 0/3] [RFC] python-package-generator
Message-ID: <1433170569-15031-1-git-send-email-denis.thulin@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series:
* Add utility python-package-generator.py
* Add package python-robotframework
* Add package python-magic

python-package-generator is an utility intended to automatically generate
python packages for buildroot using metadata provided by the python package
index (https://pypi.python.org).

python-robotframework and python magic are packages generated using
python-package-generator.py



Denis THULIN (3):
  python-package-generator: new utility
  python-robotframework: New package
  python-magic: new package

 docs/manual/adding-packages-python.txt             |  36 ++
 package/Config.in                                  |   2 +
 package/python-magic/Config.in                     |   7 +
 package/python-magic/python-magic.hash             |   2 +
 package/python-magic/python-magic.mk               |  14 +
 package/python-robotframework/Config.in            |   9 +
 .../python-robotframework.hash                     |   2 +
 .../python-robotframework/python-robotframework.mk |  14 +
 support/scripts/python-package-generator.py        | 435 +++++++++++++++++++++
 9 files changed, 521 insertions(+)
 create mode 100644 package/python-magic/Config.in
 create mode 100644 package/python-magic/python-magic.hash
 create mode 100644 package/python-magic/python-magic.mk
 create mode 100644 package/python-robotframework/Config.in
 create mode 100644 package/python-robotframework/python-robotframework.hash
 create mode 100644 package/python-robotframework/python-robotframework.mk
 create mode 100755 support/scripts/python-package-generator.py

-- 
2.4.2
