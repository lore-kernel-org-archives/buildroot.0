From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Jan 2016 21:36:15 +0100
Subject: [Buildroot] [PATCH 1/1] package/collectd: bump version to 5.5.1
In-Reply-To: <1453924918-27836-1-git-send-email-bernd.kuhls@t-online.de>
References: <1453924918-27836-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160127213615.0a5a96dd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Wed, 27 Jan 2016 21:01:58 +0100, Bernd Kuhls wrote:
> Removed COLLECTD_AUTORECONF=yes because our patches applied were applied
> upstream:
> http://git.verplant.org/?p=collectd.git;a=commitdiff;h=780e6a76021a240e95007a04b723d827120afa95
> http://git.verplant.org/?p=collectd.git;a=commitdiff;h=3e3848349b753d78a0b1d19648fb394866856bda
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...libavltree-libcommon-libheap-dependencies.patch | 21 ----------------
>  package/collectd/0002-ipc-enable-gnu-source.patch  | 28 ----------------------
>  package/collectd/collectd.hash                     |  4 ++--
>  package/collectd/collectd.mk                       |  4 +---
>  4 files changed, 3 insertions(+), 54 deletions(-)
>  delete mode 100644 package/collectd/0001-build-add-libavltree-libcommon-libheap-dependencies.patch
>  delete mode 100644 package/collectd/0002-ipc-enable-gnu-source.patch

Aaah, this one, I like! I like when we can drop patches because they
have been upstreamed, and when in addition to this we can drop a
<pkg>_AUTORECONF = YES assignment.

I want more of such patches ! :-)

Obviously applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
