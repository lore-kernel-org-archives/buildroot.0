From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Thu, 30 Apr 2020 00:42:21 +0200
Subject: [Buildroot] [PATCH 0/4] package/python-pytest: new package with
 dependencies
Message-ID: <20200429224225.2454330-1-m.niestroj@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

This patch series adds pytest with all its required dependencies. There is also
a simple test provided to verify that pytest really works.

Marcin Niestroj (4):
  package/python-packaging: new package
  package/python-pluggy: new package
  package/python-pytest: new package
  support/testing: add pytest test

 .gitlab-ci.yml                                |  1 +
 DEVELOPERS                                    |  5 ++++
 package/Config.in                             |  3 +++
 package/python-packaging/Config.in            |  8 ++++++
 .../python-packaging/python-packaging.hash    |  7 ++++++
 package/python-packaging/python-packaging.mk  | 14 +++++++++++
 package/python-pluggy/Config.in               |  7 ++++++
 package/python-pluggy/python-pluggy.hash      |  5 ++++
 package/python-pluggy/python-pluggy.mk        | 15 +++++++++++
 package/python-pytest/Config.in               | 16 ++++++++++++
 package/python-pytest/python-pytest.hash      |  5 ++++
 package/python-pytest/python-pytest.mk        | 15 +++++++++++
 .../tests/package/sample_python_pytest.py     | 25 +++++++++++++++++++
 .../tests/package/test_python_pytest.py       | 19 ++++++++++++++
 14 files changed, 145 insertions(+)
 create mode 100644 package/python-packaging/Config.in
 create mode 100644 package/python-packaging/python-packaging.hash
 create mode 100644 package/python-packaging/python-packaging.mk
 create mode 100644 package/python-pluggy/Config.in
 create mode 100644 package/python-pluggy/python-pluggy.hash
 create mode 100644 package/python-pluggy/python-pluggy.mk
 create mode 100644 package/python-pytest/Config.in
 create mode 100644 package/python-pytest/python-pytest.hash
 create mode 100644 package/python-pytest/python-pytest.mk
 create mode 100644 support/testing/tests/package/sample_python_pytest.py
 create mode 100644 support/testing/tests/package/test_python_pytest.py

-- 
2.26.2
