From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Sep 2016 22:54:51 +0200
Subject: [Buildroot] [PATCH v3 0/4] Add a get-developers script and database
Message-ID: <1473713695-2611-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This is the third version of the patch series adding a get-developers
script and the corresponding DEVELOPERS database.

Since v2, the DEVELOPERS database has seen numerous updates, following
the feedback from several Buildroot developers.

Thanks,

Thomas

Thomas Petazzoni (4):
  support/scripts/get-developers: add new script
  DEVELOPERS: add initial list of Buildroot developers
  docs/manual: update contribute.txt to cover get-developers
  docs/manual: add new section about the DEVELOPERS file and
    get-developer

 DEVELOPERS                         | 1581 ++++++++++++++++++++++++++++++++++++
 docs/manual/contribute.txt         |   18 +-
 docs/manual/developers.txt         |   46 ++
 docs/manual/manual.txt             |    2 +
 support/scripts/get-developers     |   83 ++
 support/scripts/getdeveloperlib.py |  201 +++++
 6 files changed, 1929 insertions(+), 2 deletions(-)
 create mode 100644 DEVELOPERS
 create mode 100644 docs/manual/developers.txt
 create mode 100755 support/scripts/get-developers
 create mode 100644 support/scripts/getdeveloperlib.py

-- 
2.7.4
