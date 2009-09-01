From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 1 Sep 2009 16:44:06 +0200
Subject: [Buildroot] [git commit master] target/device/AMD: remove
Message-ID: <20090901145034.C66AA776F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=4d664738b036c276d4d2f5238520a1b460d277a2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It hasn't been touched in years, and Config.in refers to non-existing
files (linux.mk), so there cannot be many users.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>

Patch is too large, so refusing to show it
