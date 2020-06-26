From: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Date: Fri, 26 Jun 2020 14:30:47 +0200
Subject: [Buildroot] [PATCH v2] Allow to recompile wireless-regdb
Message-ID: <20200626123053.30626-1-dev.kurt@vandijck-laurijssen.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

changes since v1:
* more info in commit messages
* started python3-m2crypto from previously removed python-m2crypto
* no magic with local files, but explicit control to buildroot
  for the signing key to use
* add the public key for signing to linux kernel

Kind regards
Kurt
