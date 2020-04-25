From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Apr 2020 15:13:01 +0200
Subject: [Buildroot] [PATCH 0/8] core/show-info: export extra
 information about the package build (branch yem/show-info-extras)
In-Reply-To: <cover.1586592741.git.yann.morin.1998@free.fr>
References: <cover.1586592741.git.yann.morin.1998@free.fr>
Message-ID: <20200425151301.4afe82b4@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 11 Apr 2020 10:12:30 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Yann E. MORIN (8):
>       core/show-info: do not show install types for host packages
>       infra/pkg-generic: don't set INSTALL_{TARGET,STAGING,IMAGES} for host
>       core/show-info: report install types for virtual packages too
>       core/show-info: report the package build directory

So, I've applied these first four patches.

>       core/show-info: report whether a package is overriden
>       core/show-info: report package stamp files
>       core/show-info: report the ordered list of build steps

Regarding these 3, as we have discussed, I am not in favor of these
changes. I think the "progress" tool should simply have the knowledge
of the stamp files and the possible order of steps. It's not like we
change that very often.

>       core/show-info: report image name of filesystems

I just replied to this one to ask a simple question about it.
Otherwise, I think it is OK.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
