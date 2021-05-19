From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 19 May 2021 17:22:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/boost: update upstream URL
In-Reply-To: <20210503133001.22665-1-nicolas.cavallari@green-communications.fr>
References: <20210503133001.22665-1-nicolas.cavallari@green-communications.fr>
Message-ID: <20210519152244.GC2268078@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Nicolas, All,

On 2021-05-03 15:30 +0200, Nicolas Cavallari spake thusly:
> The old URL does not work anymore and the package relies on
> sources.buildroot.net.  As indicated by boost's website:
> https://www.boost.org/users/news/boost_has_moved_downloads_to_jfr.html
> 
> "The service that Boost uses to serve up its releases, Bintray.com is
> being retired by JFrog on the 1st of May. Fortunately for Boost, they
> have a new service, called JFrog.Arifactory, which we have transitioned
> to.
> 
> For the users of Boost, the only difference is that there is a new URL
> to download releases and snapshots."
> 
> Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>

Thanks for your patch. Another patch was submitted a few days later, and
we applied it and missed yours. Thanks for the patch anyway! :-)

Regards,
Yann E. MORIN.

> ---
>  package/boost/boost.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/boost/boost.mk b/package/boost/boost.mk
> index b8f90bb836..8d745ecc72 100644
> --- a/package/boost/boost.mk
> +++ b/package/boost/boost.mk
> @@ -6,7 +6,7 @@
>  
>  BOOST_VERSION = 1.75.0
>  BOOST_SOURCE = boost_$(subst .,_,$(BOOST_VERSION)).tar.bz2
> -BOOST_SITE = https://dl.bintray.com/boostorg/release/$(BOOST_VERSION)/source
> +BOOST_SITE = https://boostorg.jfrog.io/artifactory/main/release/$(BOOST_VERSION)/source
>  BOOST_INSTALL_STAGING = YES
>  BOOST_LICENSE = BSL-1.0
>  BOOST_LICENSE_FILES = LICENSE_1_0.txt
> -- 
> 2.31.1
> 
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
