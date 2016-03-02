From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Mar 2016 21:20:27 +0100
Subject: [Buildroot] [git commit] avahi: move libdns_sd compat hook
	definition inside conditional block
Message-ID: <20160302202800.F40A380203@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2dfabd10d1e484d84c0e6b5a58ab43d131ca3230
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As directed in the buildroot manual, "Optional hooks: keep hook
definition and assignment together in one if block".  And also
to be consistent with the rest of avahi.mk.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/avahi/avahi.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Patch is too large, so refusing to show it
