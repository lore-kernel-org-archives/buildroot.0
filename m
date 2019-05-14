From: Mirza Krak <mirza.krak@northern.tech>
Date: Tue, 14 May 2019 11:04:48 +0200
Subject: [Buildroot] [PATCH 0/2] misc package/mender updates
Message-ID: <20190514090450.20142-1-mirza.krak@northern.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Small series:

- fixing a configuration error in the default mender.conf
- installing additional available inventory scripts

Note that there is a patch pending to bump this package to 2.0.0 [1],
which might require a rebase of either this one or the bump to 2.0.0.

[1]. http://lists.busybox.net/pipermail/buildroot/2019-May/249797.html

Mirza Krak (2):
  package/mender: update rootfs parts in mender.conf
  package/mender: install additional inventory scripts

 package/mender/mender.conf | 4 ++--
 package/mender/mender.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.11.0
