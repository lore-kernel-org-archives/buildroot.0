From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Wed, 23 Dec 2020 17:12:21 +0100
Subject: [Buildroot] [PATCH 0/3] package/python-aiohttp: add missing
 python-typing-extensions dependency
Message-ID: <20201223161224.69815-1-m.niestroj@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

aiohttp requires typing_extensions starting from version 3.7.1. Bump also
python-typing, so that it matches added python-typing-extensions version.

Marcin Niestroj (3):
  package/python-typing: bump to version 3.7.4.3
  package/python-typing-extensions: new package
  package/python-aiohttp: add missing python-typing-extensions
    dependency

 package/Config.in                                  |  1 +
 package/python-aiohttp/Config.in                   |  5 +++--
 package/python-typing-extensions/Config.in         |  7 +++++++
 .../python-typing-extensions.hash                  |  5 +++++
 .../python-typing-extensions.mk                    | 14 ++++++++++++++
 package/python-typing/python-typing.hash           |  6 +++---
 package/python-typing/python-typing.mk             |  4 ++--
 7 files changed, 35 insertions(+), 7 deletions(-)
 create mode 100644 package/python-typing-extensions/Config.in
 create mode 100644 package/python-typing-extensions/python-typing-extensions.hash
 create mode 100644 package/python-typing-extensions/python-typing-extensions.mk

-- 
2.29.2
