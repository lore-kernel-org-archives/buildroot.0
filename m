From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 02 Jun 2013 21:19:09 -0000
Subject: [Buildroot] [git commit] ptpd: new package
Message-ID: <20130602212038.E2FCF9A6D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7d6449bb165c8708652bbc3e0373cc6d70299afe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add the new ptpd package, loosely based on the one from bug #2305.
This one handles the IEEE 1588-2002 spec.

[Peter: mark init script as executable]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in      |    1 +
 package/ptpd/Config.in |    7 +++++++
 package/ptpd/S65ptpd   |   29 +++++++++++++++++++++++++++++
 package/ptpd/ptpd.mk   |   25 +++++++++++++++++++++++++
 4 files changed, 62 insertions(+), 0 deletions(-)

Patch is too large, so refusing to show it
