From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 May 2021 23:37:45 +0200
Subject: [Buildroot] [PATCH 0/3] My take on the at91bootstrap 4.x story
Message-ID: <20210518213749.144355-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

In order to hopefully make progress on the at91bootstrap 4.x story,
here is a series of patches, based on the existing work from Eugen
Hristev, which matches better what I believe we want to have in
Buildroot.

The only annoyance that I have with applying this right now is that
the "latest" version of at91bootstrap would now be 4.0.0-rc2, which is
not a "final" release.

Reviews/comments welcome.

This is also available on Github at:

  https://github.com/tpetazzoni/buildroot/commits/at91bootstrap4

Thomas

Eugen Hristev (2):
  boot/at91bootstrap3: add support for at91bootstrap 4.x series
  boot/at91bootstrap3: add BR2_TARGET_AT91BOOTSTRAP3_NEEDS_PYTHON3

Thomas Petazzoni (1):
  boot/at91bootstrap3: bump 3.x series to 3.10.2

 boot/at91bootstrap3/Config.in           | 20 ++++++++++++++++----
 boot/at91bootstrap3/at91bootstrap3.hash |  3 ++-
 boot/at91bootstrap3/at91bootstrap3.mk   |  6 +++++-
 3 files changed, 23 insertions(+), 6 deletions(-)

-- 
2.31.1
