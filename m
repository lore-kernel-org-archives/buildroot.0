From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Nov 2015 17:20:38 +0100
Subject: [Buildroot] [PATCH] uclibc: update to 1.0.9
In-Reply-To: <20151115122850.GA29521@waldemar-brodkorb.de>
References: <20151115122850.GA29521@waldemar-brodkorb.de>
Message-ID: <20151116172038.4bf5a229@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 15 Nov 2015 13:28:50 +0100, Waldemar Brodkorb wrote:
> Fixes a fanotify include bug where old kernels (2.6.x) fail to build.
> Fixes recent failures on x86 with Linux 4.3.x kernel regarding
> network sockets. Includes the removed patch.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@uclibc-ng.org>

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

I didn't test, but I checked the changelog between 1.0.8 and 1.0.9, and
it seems minimal, and really fixes 2 problems that are currently
affecting Buildroot: fanotify build issues with old kernel headers and
the network issue on x86 with 4.3 kernels.

To me, this should be applied to master.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
