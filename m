From: Alexander Clouter <alex+buildroot@digriz.org.uk>
Date: Mon, 2 Feb 2015 17:01:23 +0000
Subject: [Buildroot] [PATCH] odhcp6c: new package
In-Reply-To: <1422891567-14861-1-git-send-email-patrickdepinguin@gmail.com>
References: <1422891567-14861-1-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <20150202170123.GF4329@marmot>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks!  You can add to the list that I compile and use this on mipsel/uclibc.

Kind Regards

On Mon, Feb 02, 2015 at 04:39:27PM +0100, Thomas De Schampheleire wrote:
>From: Alexander Clouter <alex+buildroot@digriz.org.uk>
>
>Signed-off-by: Alexander Clouter <alex+buildroot@digriz.org.uk>
>[ThomasDS: needs ipv6; rewrap package/odhcp6c/Config.in]
>Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>Tested-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>(compile-tested on x86/glibc, armel/glibc, armel/uclibc)
>---
> package/Config.in          |  1 +
> package/odhcp6c/Config.in  | 11 +++++++++++
> package/odhcp6c/odhcp6c.mk | 12 ++++++++++++
> 3 files changed, 24 insertions(+)
> create mode 100644 package/odhcp6c/Config.in
> create mode 100644 package/odhcp6c/odhcp6c.mk

-- 
Alexander Clouter
.sigmonster says: There are no games on this system.
