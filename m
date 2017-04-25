From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Tue, 25 Apr 2017 12:14:14 -0700
Subject: [Buildroot] [PATCH 0/9] Update IPython's dependencies
Message-ID: <20170425191423.13294-1-andrew.smirnov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everyone,

I recently tried using IPython on Buidroot based system and ran into a
number of missing dependencies. The patches in this series are all of
the fixes I had to apply in order to make IPython work.

Any feedback is welcome.

Thanks,
Andrey Smirnov

Andrey Smirnov (9):
  package/python-decorator: New package
  package/python-traitlets: New package
  package/python-simplegeneric: New package
  package/python-ipython-genutils: New package
  package/python-scandir: New package
  package/python-pathlib2: New package
  package/python-pickleshare: New package
  package/python-backports-shutil-get-terminal-size: New package
  package/python-ipython: Add dependecy list

 package/Config.in                                  |  8 ++++++++
 .../Config.in                                      |  9 ++++++++
 .../python-backports-shutil-get-terminal-size.hash |  2 ++
 .../python-backports-shutil-get-terminal-size.mk   | 13 ++++++++++++
 package/python-decorator/Config.in                 |  6 ++++++
 package/python-decorator/python-decorator.mk       | 13 ++++++++++++
 package/python-ipython-genutils/Config.in          |  6 ++++++
 .../python-ipython-genutils.hash                   |  4 ++++
 .../python-ipython-genutils.mk                     | 14 +++++++++++++
 package/python-ipython/Config.in                   | 10 +++++++++
 package/python-ipython/python-ipython.mk           | 14 +++++++++++++
 package/python-pathlib2/Config.in                  | 14 +++++++++++++
 package/python-pathlib2/python-pathlib2.hash       |  2 ++
 package/python-pathlib2/python-pathlib2.mk         | 24 ++++++++++++++++++++++
 package/python-pickleshare/Config.in               |  7 +++++++
 package/python-pickleshare/python-pickleshare.hash |  2 ++
 package/python-pickleshare/python-pickleshare.mk   | 22 ++++++++++++++++++++
 package/python-scandir/Config.in                   |  6 ++++++
 package/python-scandir/python-scandir.hash         |  2 ++
 package/python-scandir/python-scandir.mk           | 13 ++++++++++++
 package/python-simplegeneric/Config.in             |  6 ++++++
 .../python-simplegeneric/python-simplegeneric.hash |  4 ++++
 .../python-simplegeneric/python-simplegeneric.mk   | 19 +++++++++++++++++
 package/python-traitlets/Config.in                 |  8 ++++++++
 package/python-traitlets/python-traitlets.hash     |  2 ++
 package/python-traitlets/python-traitlets.mk       | 18 ++++++++++++++++
 26 files changed, 248 insertions(+)
 create mode 100644 package/python-backports-shutil-get-terminal-size/Config.in
 create mode 100644 package/python-backports-shutil-get-terminal-size/python-backports-shutil-get-terminal-size.hash
 create mode 100644 package/python-backports-shutil-get-terminal-size/python-backports-shutil-get-terminal-size.mk
 create mode 100644 package/python-decorator/Config.in
 create mode 100644 package/python-decorator/python-decorator.mk
 create mode 100644 package/python-ipython-genutils/Config.in
 create mode 100644 package/python-ipython-genutils/python-ipython-genutils.hash
 create mode 100644 package/python-ipython-genutils/python-ipython-genutils.mk
 create mode 100644 package/python-pathlib2/Config.in
 create mode 100644 package/python-pathlib2/python-pathlib2.hash
 create mode 100644 package/python-pathlib2/python-pathlib2.mk
 create mode 100644 package/python-pickleshare/Config.in
 create mode 100644 package/python-pickleshare/python-pickleshare.hash
 create mode 100644 package/python-pickleshare/python-pickleshare.mk
 create mode 100644 package/python-scandir/Config.in
 create mode 100644 package/python-scandir/python-scandir.hash
 create mode 100644 package/python-scandir/python-scandir.mk
 create mode 100644 package/python-simplegeneric/Config.in
 create mode 100644 package/python-simplegeneric/python-simplegeneric.hash
 create mode 100644 package/python-simplegeneric/python-simplegeneric.mk
 create mode 100644 package/python-traitlets/Config.in
 create mode 100644 package/python-traitlets/python-traitlets.hash
 create mode 100644 package/python-traitlets/python-traitlets.mk

-- 
2.9.3
