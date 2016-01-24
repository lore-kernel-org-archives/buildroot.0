From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 24 Jan 2016 01:48:03 +0100
Subject: [Buildroot] [PATCH 1/1] package/odhcp6c: bump version to fix
 musl build
In-Reply-To: <1453591294-24061-1-git-send-email-bernd.kuhls@t-online.de>
References: <1453591294-24061-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <56A41F43.7030402@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 24-01-16 00:21, Bernd Kuhls wrote:
> The autobuilders did not catch the error yet because they failed
> earlier with other packages, but I am continuing the build using
> the defconfig from:
> http://autobuild.buildroot.net/results/6cc/6cc0f8c067e07deea688b9b97284601a596b898c/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/odhcp6c/odhcp6c.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

 Could you also add a hash file?

 Regards,
 Arnout

> 
> diff --git a/package/odhcp6c/odhcp6c.mk b/package/odhcp6c/odhcp6c.mk
> index 47944f1..c841cd3 100644
> --- a/package/odhcp6c/odhcp6c.mk
> +++ b/package/odhcp6c/odhcp6c.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -ODHCP6C_VERSION = 8d9b60fb496000988f3633951f2e30380fc2de50
> +ODHCP6C_VERSION = dc186d6d2b0dd4ad23ca5fc69c00e81f796ff6d9
>  ODHCP6C_SITE = $(call github,sbyx,odhcp6c,$(ODHCP6C_VERSION))
>  ODHCP6C_LICENSE = GPLv2
>  ODHCP6C_LICENSE_FILES = COPYING
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
