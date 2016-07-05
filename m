From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Jul 2016 15:57:20 +0200
Subject: [Buildroot] [git commit] package/skeleton: remove useless .empty
	file
Message-ID: <20160705152113.CE4998222B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=784d49c2d3f4b000e2805ca808e99d399ea251f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We now have a real file in that directory, so we do not need a .empty
placeholder.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 system/skeleton/etc/network/if-pre-up.d/.empty | 0
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/system/skeleton/etc/network/if-pre-up.d/.empty b/system/skeleton/etc/network/if-pre-up.d/.empty
deleted file mode 100644
index e69de29..0000000
