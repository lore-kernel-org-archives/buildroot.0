From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Tue, 25 Sep 2018 23:55:09 -0300
Subject: [Buildroot] [PATCH 0/5] a few more runtime test cases for python
 packages - series 1/n
Message-ID: <20180926025514.2092-1-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

One way to reduce the burden of manual tests and also detecting broken runtime
dependencies is to have more test cases (even simple ones) for python packages.
Well... here are some.

Complete run on gitlab CI:
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/31209399

Regards,
Ricardo

Ricardo Martincoski (5):
  support/testing: add python-autobahn tests
  support/testing: add python-txaio tests
  support/testing: add python-txtorcon tests
  support/testing: add python-incremental tests
  support/testing: add python-twisted tests

 .gitlab-ci.yml                                | 10 ++++
 .../tests/package/test_python_autobahn.py     | 32 +++++++++++
 .../tests/package/test_python_incremental.py  | 34 ++++++++++++
 .../tests/package/test_python_twisted.py      | 54 +++++++++++++++++++
 .../tests/package/test_python_txaio.py        | 34 ++++++++++++
 .../tests/package/test_python_txtorcon.py     | 32 +++++++++++
 6 files changed, 196 insertions(+)
 create mode 100644 support/testing/tests/package/test_python_autobahn.py
 create mode 100644 support/testing/tests/package/test_python_incremental.py
 create mode 100644 support/testing/tests/package/test_python_twisted.py
 create mode 100644 support/testing/tests/package/test_python_txaio.py
 create mode 100644 support/testing/tests/package/test_python_txtorcon.py

-- 
2.17.1
