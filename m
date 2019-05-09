From: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
Date: Thu,  9 May 2019 17:58:48 +0200
Subject: [Buildroot] [PATCH 0/2] matplotlib for python 2d graphics
Message-ID: <1557417530-25084-1-git-send-email-jugurtha.belkalem@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This library allows to have 2D data visualization
in python.

This library requires Python>=3.5.

Jugurtha BELKALEM (2):
  package/python-cycler: new package
  package/python-matplotlib: new package

 DEVELOPERS                                         |  4 +++
 package/Config.in                                  |  2 ++
 package/python-cycler/Config.in                    |  8 ++++++
 package/python-cycler/python-cycler.hash           |  4 +++
 package/python-cycler/python-cycler.mk             | 14 +++++++++++
 .../0001-Fix-invalid-inclusion-headers.patch       | 29 ++++++++++++++++++++++
 package/python-matplotlib/Config.in                | 22 ++++++++++++++++
 package/python-matplotlib/python-matplotlib.hash   |  4 +++
 package/python-matplotlib/python-matplotlib.mk     | 16 ++++++++++++
 9 files changed, 103 insertions(+)
 create mode 100644 package/python-cycler/Config.in
 create mode 100644 package/python-cycler/python-cycler.hash
 create mode 100644 package/python-cycler/python-cycler.mk
 create mode 100644 package/python-matplotlib/0001-Fix-invalid-inclusion-headers.patch
 create mode 100644 package/python-matplotlib/Config.in
 create mode 100644 package/python-matplotlib/python-matplotlib.hash
 create mode 100644 package/python-matplotlib/python-matplotlib.mk

-- 
2.7.4
