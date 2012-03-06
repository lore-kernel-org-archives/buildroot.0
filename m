From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 6 Mar 2012 23:05:46 +0100
Subject: [Buildroot] [git commit] gpsd: dbus interface requires dbus-glib
Message-ID: <20120306223952.6291190D16@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b5410b6a19db7ef75af8df2fa5659c539ad37c47
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gpsd uses dbus-glib as the dbus interface, so it should only be built if
libglib2 has been selected.  To simplify things, build dbus support only
if dbus-glib is selected.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gpsd/Config.in |    2 ++
 package/gpsd/gpsd.mk   |    4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)

Patch is too large, so refusing to show it
