From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 30 Dec 2017 11:28:56 +0100
Subject: [Buildroot] [PATCH] python-crossbar: add a warning comment
 concerning version bump
In-Reply-To: <20170302135853.3111-1-yegorslists@googlemail.com>
References: <20170302135853.3111-1-yegorslists@googlemail.com>
Message-ID: <20171230102856.GA2921@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yegor, All,

On 2017-03-02 14:58 +0100, yegorslists at googlemail.com spake thusly:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> The latest crossbar needs a rather recent setuptools package, that
> has circular dependencies. Until this issue is not resolved, it is
> not safe to bump crossbar version.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/python-crossbar/python-crossbar.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/python-crossbar/python-crossbar.mk b/package/python-crossbar/python-crossbar.mk
> index 3d82d7704..9c543e6cc 100644
> --- a/package/python-crossbar/python-crossbar.mk
> +++ b/package/python-crossbar/python-crossbar.mk
> @@ -4,6 +4,8 @@
>  #
>  ################################################################################
>  
> +# don't bump version as newer setuptools package is needed,
> +# that still didn't make its way into BR

Now that we are using setup-tools 36.0.1, is this comment still valid?

Regards,
Yann E. MORIN.

>  PYTHON_CROSSBAR_VERSION = 0.14.0
>  PYTHON_CROSSBAR_SOURCE = crossbar-$(PYTHON_CROSSBAR_VERSION).tar.gz
>  PYTHON_CROSSBAR_SITE = https://pypi.python.org/packages/f0/9a/e0b77e15698c47b6293655bc0e1996dd8e87bd8af7bc7434a5c8281a024e
> -- 
> 2.11.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
