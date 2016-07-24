From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Jul 2016 22:00:23 +0200
Subject: [Buildroot] [PATCH 1/3] docker-containerd: pass -extldflags
 '-static' on when BR2_STATIC_LIBS=y
In-Reply-To: <1469371427-25201-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1469371427-25201-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160724220023.0b68eb2b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 24 Jul 2016 16:43:45 +0200, Thomas Petazzoni wrote:
> There is no reason to link Go binaries statically, unless when
> BR2_STATIC_LIBS=y.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/docker-containerd/docker-containerd.mk | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

All three patches applied with Christian's Tested-by. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
