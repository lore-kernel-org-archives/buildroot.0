From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 18 Mar 2013 22:19:51 +0100
Subject: [Buildroot] [git commit] oprofile: upstep 0.9.7 patches to 0.9.8
Message-ID: <20130318212049.748519A9F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=145794b56fd0b5df0d6e2ff12c23ad859f40e4a8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The patches to oprofile 0.9.7 seem still relevant for 0.9.8, but for some
reason they were not upstepped.

[Peter: drop version number from patch filenames]
Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...oprofile-001-avr32-enable-lookup_dcookie.patch} |    0
 ...s.patch => oprofile-002-no-query-modules.patch} |    0
 2 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/oprofile/oprofile-0.9.7-001-avr32-enable-lookup_dcookie.patch b/package/oprofile/oprofile-001-avr32-enable-lookup_dcookie.patch
similarity index 100%
rename from package/oprofile/oprofile-0.9.7-001-avr32-enable-lookup_dcookie.patch
rename to package/oprofile/oprofile-001-avr32-enable-lookup_dcookie.patch
diff --git a/package/oprofile/oprofile-0.9.7-002-no-query-modules.patch b/package/oprofile/oprofile-002-no-query-modules.patch
similarity index 100%
rename from package/oprofile/oprofile-0.9.7-002-no-query-modules.patch
rename to package/oprofile/oprofile-002-no-query-modules.patch
