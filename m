From: Ash Charles <ashcharles@gmail.com>
Date: Mon, 13 Jan 2020 19:58:40 -0500
Subject: [Buildroot] [PATCH 0/2] Version bumps for PRU packages
Message-ID: <20200114005842.45810-1-ashcharles@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump versions for TI's PRU co-processor toolcahin and support libraries.

Note, I don't have hardware so I'm unable to confirm that these versions
do more than build correctly.

Ash Charles (2):
  ti-cgt-pru: bump to latest version 2.3.3
  pru-software-support: bump to latest version 5.6.0

 package/pru-software-support/pru-software-support.hash | 2 +-
 package/pru-software-support/pru-software-support.mk   | 7 ++++---
 package/ti-cgt-pru/ti-cgt-pru.hash                     | 6 +++---
 package/ti-cgt-pru/ti-cgt-pru.mk                       | 4 ++--
 4 files changed, 10 insertions(+), 9 deletions(-)

-- 
2.24.1
