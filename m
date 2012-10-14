From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Oct 2012 19:55:56 +0200
Subject: [Buildroot] [PATCH] pkg-infra: correct the source name for
 host-only packages
In-Reply-To: <1350227854-6823-1-git-send-email-arnout@mind.be>
References: <20120611105621.0aacd20c@skate>
 <1350227854-6823-1-git-send-email-arnout@mind.be>
Message-ID: <20121014195556.35bac7ee@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Sun, 14 Oct 2012 17:17:34 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> Host-only package that don't define their <PKG>_SOURCE variable would
> default to host-<pkg>-<version>.tar.gz.  It's more logical to remove
> the host- prefix in this case.
> 
> This problem is most apparent with host-only packages downloaded from
> version control, because they never define <PKG>_SOURCE.
> 
> Reported by Thomas Petazzoni and initial analysis by Luca Ceresoli.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
