From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 7 Jul 2020 22:03:31 +0200
Subject: [Buildroot] [PATCH 1/1] package/angularjs: bump version to 1.8.0
In-Reply-To: <20200707093357.47qao64bbwoe6hcb@zenon.in.qult.net>
References: <20200707093357.47qao64bbwoe6hcb@zenon.in.qult.net>
Message-ID: <20200707200331.GR2273@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ignacy, All,

On 2020-07-07 11:33 +0200, Ignacy Gaw?dzki spake thusly:
> Signed-off-by: Ignacy Gaw?dzki <ignacy.gawedzki@green-communications.fr>

Applied to master, thanks.

But see a nit below...

> ---
>  package/angularjs/angularjs.hash | 4 ++--
>  package/angularjs/angularjs.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/angularjs/angularjs.hash b/package/angularjs/angularjs.hash
> index 4f0f36b2a1..abfb36dd1c 100644
> --- a/package/angularjs/angularjs.hash
> +++ b/package/angularjs/angularjs.hash
> @@ -1,3 +1,3 @@
>  # Locally computed:
> -sha256	7182e7f39b921469157971d9e0783745758df4b625322d606ec7d9abf2b28af2	angular-1.7.9.zip
> -sha256	2420c59374dcdc1ca9721c334a32afee92f0610280cae0d1b3952b1279bc2b24	angular.js
> +sha256	c4098f594dc24cc4c8ad469c6d5785a65c0df812afe9f56ea0e4d3490c2fd46d angular-1.8.0.zip
> +sha256	c7df41bc00628bec220b0378dc1f2f5041980758403b6f24b9774ac43a9186d8  angular.js

Aha! I see you munged the spacing; you almost got it correct: it is
indeed two spaces between fields by convention, now.; so 1 out of 2
correct. But you missed the TAB between the type and the hash. Fixed all
that and applied to master. Thanks! :-)

Regards,
Yann E. MORIN.

> diff --git a/package/angularjs/angularjs.mk b/package/angularjs/angularjs.mk
> index 295be5400a..53b837e59f 100644
> --- a/package/angularjs/angularjs.mk
> +++ b/package/angularjs/angularjs.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -ANGULARJS_VERSION = 1.7.9
> +ANGULARJS_VERSION = 1.8.0
>  ANGULARJS_SOURCE = angular-$(ANGULARJS_VERSION).zip
>  ANGULARJS_SITE = https://code.angularjs.org/$(ANGULARJS_VERSION)
>  ANGULARJS_LICENSE = MIT
> -- 
> 2.25.1
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
