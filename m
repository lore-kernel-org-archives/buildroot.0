From: Petr Vorel <petr.vorel@gmail.com>
Date: Mon, 25 Feb 2019 22:14:33 +0100
Subject: [Buildroot] [PATCH-for-master 2/2] package/iproute2: backport
 patch to fix compilation under glibc < 2.18
In-Reply-To: <20190225211147.14947-3-patrickdepinguin@gmail.com>
References: <20190225211147.14947-1-patrickdepinguin@gmail.com>
 <20190225211147.14947-3-patrickdepinguin@gmail.com>
Message-ID: <20190225211431.GA28518@x230>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

> When compiling iproute2 using a toolchain containing glibc 2.17 and older, it fails due to a missing definition of AF_VSOCK.

> Add a submitted and accepted upstream patch to fix this issue.

> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

Thanks for your fix!


Kind regards,
Petr
