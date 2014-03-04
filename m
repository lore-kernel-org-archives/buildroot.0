From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Mar 2014 19:39:22 +0100
Subject: [Buildroot] [git commit] samba4: move x86_64 answer cache file
Message-ID: <20140304183929.563428AC85@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=00ba92454a53687260d1cb415d8aaa153ec94c31
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The x86_64 answer cache file from commit
d191d40e3fd8cef7fbf3168fdc261de8d4b114fd was intended for a previous
draft version of the samba4 package that resided in a different
directory.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/{samba => }/samba4/x86_64-cache.txt |    0
 1 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/samba/samba4/x86_64-cache.txt b/package/samba4/x86_64-cache.txt
similarity index 100%
rename from package/samba/samba4/x86_64-cache.txt
rename to package/samba4/x86_64-cache.txt
