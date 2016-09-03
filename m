From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 3 Sep 2016 13:07:39 +0200
Subject: [Buildroot] [PATCH 7/9] package/expedite: bump to lastest commit
In-Reply-To: <1472848295-13734-7-git-send-email-romain.naour@gmail.com>
References: <1472848295-13734-1-git-send-email-romain.naour@gmail.com>
 <1472848295-13734-7-git-send-email-romain.naour@gmail.com>
Message-ID: <c7ea43cd-69e3-204e-5aae-6fc66145065e@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Le 02/09/2016 ? 22:31, Romain Naour a ?crit :
> expedite from 1.15 branch doesn't build anymore with efl 1.18 due to
> API changes. Since there is no new release or 1.18 scpecific branch,
> use the latest commit.
> 
> Add a hash file.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/expedite/expedite.hash | 2 ++
>  package/expedite/expedite.mk   | 3 +--
>  2 files changed, 3 insertions(+), 2 deletions(-)
>  create mode 100644 package/expedite/expedite.hash
> 
> diff --git a/package/expedite/expedite.hash b/package/expedite/expedite.hash
> new file mode 100644
> index 0000000..0438dcf
> --- /dev/null
> +++ b/package/expedite/expedite.hash
> @@ -0,0 +1,2 @@
> +# locally computed
> +sha256 a8690a714c16d6b67e7fd6d70973e9805c3569a9131900b1feaf183220496831  dl/expedite-ffa005ea3de26b4219f32c285cb1665bb1366163.tar.gz
                                                                            ^^^
Sorry, copy-past error :-/

Best regards,
Romain

> diff --git a/package/expedite/expedite.mk b/package/expedite/expedite.mk
> index 8754dc0..0b2901d 100644
> --- a/package/expedite/expedite.mk
> +++ b/package/expedite/expedite.mk
> @@ -4,8 +4,7 @@
>  #
>  ################################################################################
>  
> -# efl-1.15 branch
> -EXPEDITE_VERSION = 3ce8b3f1451700f9a2da60c2e717c644220e2449
> +EXPEDITE_VERSION = ffa005ea3de26b4219f32c285cb1665bb1366163
>  EXPEDITE_SITE = http://git.enlightenment.org/tools/expedite.git
>  EXPEDITE_SITE_METHOD = git
>  EXPEDITE_LICENSE = BSD-2c
> 
