From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Tue, 11 Jul 2017 19:40:03 -0700
Subject: [Buildroot] [PATCH v2 0/6] Python/IPython unit test changes
Message-ID: <20170712024009.2366-1-andrew.smirnov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everyone,

This is a second version of the Python/IPython related patchset.

Changes since [v1]:

    - Move timeout from login() to run()

    - Split patch 2/3 in original submission into multiple discreet
      changes

Any feedback is much appreciated!

Thanks,
Andrey Smirnov

[v1]: http://lists.busybox.net/pipermail/buildroot/2017-July/196735.html

Andrey Smirnov (6):
  testing/infra/emulator: allow to specify pexpect timeout
  testing/tests/package/test_python: refactor TestPythonBase
  testing/tests/package/test_python: add TestPython3
  testing/tests/package/test_python: do not hardcode interpreter name
  testing/tests/package/test_python: allow to change timeout
  testing/tests/package: add basic unit test for IPython

 support/testing/infra/emulator.py             |  6 ++--
 support/testing/tests/package/test_ipython.py | 38 ++++++++++++++++++++
 support/testing/tests/package/test_python.py  | 52 +++++++++++++++++++++------
 3 files changed, 82 insertions(+), 14 deletions(-)
 create mode 100644 support/testing/tests/package/test_ipython.py

-- 
2.9.4
