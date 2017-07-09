From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 10 Jul 2017 01:21:16 +0200
Subject: [Buildroot] [PATCH 0/7] More HOST_DIR/usr fixes
Message-ID: <20170709232123.30120-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas started rebuilding the toolchains after the HOST_DIR/usr removal
and noticed a corner case that didn't work. While investigating that, I
uncovered a slew of other issues.

I was also in the process of adding a test for
BR2_TOOLCHAIN_EXTERNAL_PREINSTALLED=y but that turns out to require a
lot of refactoring of the testing infra. So it's for another day.

Regards,
Arnout
