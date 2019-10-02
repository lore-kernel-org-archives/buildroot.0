From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 2 Oct 2019 21:53:46 +0200
Subject: [Buildroot] [PATCH v1] package/libv4l: bump version to 1.18.0
In-Reply-To: <20191002194316.978-1-ps.report@gmx.net>
References: <20191002194316.978-1-ps.report@gmx.net>
Message-ID: <20191002215346.695a5310@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  2 Oct 2019 21:43:16 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> - remove 0001-fixup-lfs-mismatch-in-preload-libraries.patch
>   (Upstream applied [1])
> - remove 0002-keytable-fix-EVIOCSCLOCKID-related-compile-failure.patch
>   (Upstream applied [2])
> - remove 0003-Build-sdlcam-only-if-jpeg-is-enabled.patch
>   (Upstream applied [3])
> - remove 0004-v4l2-compliance-needs-fork.patch
>   (Upstream applied [4])

Since there are no patch left, do we still need AUTORECONF = YES and
the dependency on host-gettext ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
