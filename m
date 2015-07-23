From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Jul 2015 22:29:48 +0200
Subject: [Buildroot] [PATCH] ltrace: fix patch name
In-Reply-To: <1437651295-888-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1437651295-888-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20150723222948.0cacc5ee@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Thu, 23 Jul 2015 13:34:55 +0200, Vicente Olivert Riera wrote:
> Rename 0002-Install-lib-types.conf to 0002-Install-lib-types-conf.patch
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  .../{0002-Install-lib-types.conf => 0002-Install-lib-types-conf.patch}    | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename package/ltrace/{0002-Install-lib-types.conf => 0002-Install-lib-types-conf.patch} (100%)
> 
> diff --git a/package/ltrace/0002-Install-lib-types.conf b/package/ltrace/0002-Install-lib-types-conf.patch
> similarity index 100%
> rename from package/ltrace/0002-Install-lib-types.conf
> rename to package/ltrace/0002-Install-lib-types-conf.patch

Doh, how could I miss that :-/

Thanks for spotting and fixing!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
