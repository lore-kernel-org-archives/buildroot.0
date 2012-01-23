From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 Jan 2012 22:36:57 +0100
Subject: [Buildroot] [PATCH] ext-toolchain: Automatically set -m64 if
 the architecture is x86_64
In-Reply-To: <1327169083-15538-1-git-send-email-arnout@mind.be>
References: <1327169083-15538-1-git-send-email-arnout@mind.be>
Message-ID: <20120123223657.32c86e82@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sat, 21 Jan 2012 19:04:43 +0100,
"Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be> a ?crit :

> From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
> 
> Without the -m64, choosing the x86_64 architecture with a Sourcery
> external toolchain will result in a 32-bit rootfs.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  This patch comes on top of ThomasP's external toolchain updates
> http://free-electrons.com/~thomas/buildroot.git
> for-2012.02/ext-toolchain-updates (Without those updates, the
> Sourcery x86 toolchain simply doesn't work, because it creates 32-bit
> executables but the libc installed on the target is 64-bit.)
> 
>  Thomas, it would be great if you could add this patch to your branch.

Looks good. I'll integrate it in my branch and repost the whole branch
soon.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
