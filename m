From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Aug 2017 21:19:41 +0200
Subject: [Buildroot] [PATCH v5 00/14] system: properly handle systemd as
 init system
In-Reply-To: <20170801225224.16899-1-arnout@mind.be>
References: <20170801225224.16899-1-arnout@mind.be>
Message-ID: <20170802211941.15c8ed74@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 2 Aug 2017 00:52:10 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:

> Arnout Vandecappelle (1):
>   skeleton-common: rename SKELETON_ROOT_PASSWORD to
>     SKELETON_CUSTOM_ROOT_PASSWORD
> 
> Yann E. MORIN (13):
>   support/testing: add runtime testing for init systems
>   package/skeleton: split out into skeleton-custom
>   package/skeleton-custom: rework the merged_usr and building conditions
>   package/skeleton-custom: also check for missing directories
>   package/skeleton-custom: simplify target/staging install
>   package/skeleton: split out into skeleton-common
>   package/skeleton: make it a virtual package
>   package/skeleton-common: simplify staging install
>   package/skeleton: introduce sysv- and systemd-specific skeletons
>   system: separate sysv and systemd parts of the skeleton
>   fs: add pre- and post-command hooks
>   system: make systemd work on a read-only rootfs
>   support/testing: add runtime testing for read-only systemd

I've now applied the entire series. Thanks to Yann for all the work,
and thanks Arnout for the final polishing.

I made a few changes here and there, which I commented as replies to
the respective patches.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
