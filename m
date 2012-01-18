From: Will Newton <will.newton@gmail.com>
Date: Wed, 18 Jan 2012 11:15:14 +0000
Subject: [Buildroot] [PATCH 0/7] EFL packages for buildroot
Message-ID: <CAFbHwiQEZ4T8xdPk9hx9MihC4LDMcvWTueuG1KfdxzQywG_B+Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

These patches update the ones posted by Lionel Landwerlin a couple of years
ago, moving to released versions of the libraries and fixing up to reflect
changes in the buildroot infrastructure over the years.

Will Newton (7):
  libeina: Add new package along with EFL infrastructure.
  libeet: Add new package.
  libevas: Add new package.
  libecore: Add new package.
  libembryo: Add new package.
  libedje: Add new package.
  expedite: Add new package.

 package/Config.in                  |    2 +
 package/efl/Config.in              |   22 ++++
 package/efl/efl.mk                 |    3 +
 package/efl/expedite/Config.in     |   13 +++
 package/efl/expedite/expedite.mk   |   11 ++
 package/efl/libecore/Config.in     |   81 +++++++++++++++
 package/efl/libecore/libecore.mk   |  124 ++++++++++++++++++++++
 package/efl/libedje/Config.in      |   19 ++++
 package/efl/libedje/libedje.mk     |   22 ++++
 package/efl/libeet/Config.in       |    9 ++
 package/efl/libeet/libeet.mk       |   15 +++
 package/efl/libeina/Config.in      |    4 +
 package/efl/libeina/libeina.mk     |   18 ++++
 package/efl/libembryo/Config.in    |    7 ++
 package/efl/libembryo/libembryo.mk |   15 +++
 package/efl/libevas/Config.in      |  199 ++++++++++++++++++++++++++++++++++++
 package/efl/libevas/libevas.mk     |  165 +++++++++++++++++++++++++++++
 17 files changed, 729 insertions(+), 0 deletions(-)
 create mode 100644 package/efl/Config.in
 create mode 100644 package/efl/efl.mk
 create mode 100644 package/efl/expedite/Config.in
 create mode 100644 package/efl/expedite/expedite.mk
 create mode 100644 package/efl/libecore/Config.in
 create mode 100644 package/efl/libecore/libecore.mk
 create mode 100644 package/efl/libedje/Config.in
 create mode 100644 package/efl/libedje/libedje.mk
 create mode 100644 package/efl/libeet/Config.in
 create mode 100644 package/efl/libeet/libeet.mk
 create mode 100644 package/efl/libeina/Config.in
 create mode 100644 package/efl/libeina/libeina.mk
 create mode 100644 package/efl/libembryo/Config.in
 create mode 100644 package/efl/libembryo/libembryo.mk
 create mode 100644 package/efl/libevas/Config.in
 create mode 100644 package/efl/libevas/libevas.mk
