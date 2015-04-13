From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Mon, 13 Apr 2015 12:24:05 +0200
Subject: [Buildroot] [PATCH 0/3] update git commit hashes of sigrok packages
Message-ID: <1428920648-12979-1-git-send-email-bgolaszewski@baylibre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Several new features and bug-fixes for baylibre-acme driver have been
merged since the revisions currently used by buildroot. We would like
to make them available to users.

Bartosz Golaszewski (3):
  libsigrok: bump commit hash
  sigrok-cli: bump commit hash
  pulseview: bump commit hash

 package/libsigrok/libsigrok.mk   | 2 +-
 package/pulseview/pulseview.mk   | 2 +-
 package/sigrok-cli/sigrok-cli.mk | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.1.4
