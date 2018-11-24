From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 24 Nov 2018 10:07:51 +0100
Subject: [Buildroot] [PATCH/next 0/3] suppport/testing: Lua and friends
Message-ID: <20181124090754.14775-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

test_lua.py allows to test the Lua interpreters,
and it is used as base class for testing Lua modules.

note1: Prosody is not a Lua module, but an application using Lua and some Lua modules.

note2: the patch 3/3 is a fix, and must be applied also in master


Francois Perrad (3):
  support/testing: add lua test
  support/testing; add prosody test
  prosody: fix runtime dependencies

 .gitlab-ci.yml                                |  4 ++
 package/prosody/Config.in                     |  5 ++
 support/testing/tests/package/test_lua.py     | 59 +++++++++++++++++++
 support/testing/tests/package/test_prosody.py | 48 +++++++++++++++
 4 files changed, 116 insertions(+)
 create mode 100644 support/testing/tests/package/test_lua.py
 create mode 100644 support/testing/tests/package/test_prosody.py

-- 
2.17.1
