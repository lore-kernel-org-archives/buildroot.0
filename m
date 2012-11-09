From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Nov 2012 11:10:22 +0100
Subject: [Buildroot] [PATCH] perl: fix build
In-Reply-To: <1352455441-4836-1-git-send-email-francois.perrad@gadz.org>
References: <1352455441-4836-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <20121109111022.57b90379@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,

On Fri,  9 Nov 2012 11:04:01 +0100, Francois Perrad wrote:
> qemu-i386 & qemu-x86_64 cannot run properly miniperl with system(),
> see https://bugs.launchpad.net/qemu/+bug/1076445
> 
> replace qemu/miniperl by host-perl.
> 
> qemu is still used during the configure step (and cpanminus).
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

This cannot apply: Arnout's patch that removes the dependency on qemu
has been applied.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
