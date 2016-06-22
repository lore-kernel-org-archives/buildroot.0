From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 22 Jun 2016 21:07:23 +0200
Subject: [Buildroot] [PATCH 01/24 v2] package/skeleton: remove useless
	.empty file
In-Reply-To: <cover.1466622379.git.yann.morin.1998@free.fr>
References: <cover.1466622379.git.yann.morin.1998@free.fr>
Message-ID: <ff7368e61707c220a37c746a171c68300445f834.1466622379.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We now have a real file in that directory, so we do not need a .empty
placeholder.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 system/skeleton/etc/network/if-pre-up.d/.empty | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 delete mode 100644 system/skeleton/etc/network/if-pre-up.d/.empty

diff --git a/system/skeleton/etc/network/if-pre-up.d/.empty b/system/skeleton/etc/network/if-pre-up.d/.empty
deleted file mode 100644
index e69de29..0000000
-- 
2.7.4
