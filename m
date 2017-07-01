From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 1 Jul 2017 18:50:58 +0200
Subject: [Buildroot] [PATCH 2/3] manual: update old references to
	support/scripts
In-Reply-To: <20170701164041.5515-2-arnout@mind.be>
References: <20170701164041.5515-1-arnout@mind.be>
 <20170701164041.5515-2-arnout@mind.be>
Message-ID: <20170701165058.GC3593@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnoult, All,

On 2017-07-01 18:40 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
> There were still some references to the old location of the scripts in
> the manual. Replace them by utils/.
> 
> While we're at it, remove the redundant ./ at the beginning of some of
> the example commands.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  docs/manual/adding-packages-python.txt | 8 ++++----
>  docs/manual/common-usage.txt           | 2 +-
>  docs/manual/developers.txt             | 2 +-
>  3 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/docs/manual/adding-packages-python.txt b/docs/manual/adding-packages-python.txt
> index a67a4bed4c..5eb6ba51b1 100644
> --- a/docs/manual/adding-packages-python.txt
> +++ b/docs/manual/adding-packages-python.txt
> @@ -167,7 +167,7 @@ possible to customize what is done in any particular step:
>  
>  If the Python package for which you would like to create a Buildroot
>  package is available on PyPI, you may want to use the +scanpypi+ tool
> -located in +support/scripts+ to automate the process.
> +located in +utils/+ to automate the process.
>  
>  You can find the list of existing PyPI packages
>  https://pypi.python.org[here].
> @@ -178,7 +178,7 @@ your host.
>  When at the root of your buildroot directory just do :
>  
>  -----------------------
> -./support/scripts/scanpypi foo bar -o package
> +utils/scanpypi foo bar -o package
>  -----------------------
>  
>  This will generate packages +python-foo+ and +python-bar+ in the package
> @@ -198,7 +198,7 @@ If your Buildroot package is not in the official Buildroot tree but in
>  a br2-external tree, use the -o flag as follows:
>  
>  -----------------------
> -./support/scripts/scanpypi foo bar -o other_package_dir
> +utils/scanpypi foo bar -o other_package_dir
>  -----------------------
>  
>  This will generate packages +python-foo+ and +python-bar+ in the
> @@ -207,7 +207,7 @@ This will generate packages +python-foo+ and +python-bar+ in the
>  Option +-h+ will list the available options:
>  
>  -----------------------
> -./support/scripts/scanpypi -h
> +utils/scanpypi -h
>  -----------------------
>  
>  [[python-package-cffi-backend]]
> diff --git a/docs/manual/common-usage.txt b/docs/manual/common-usage.txt
> index 8dd99a6dac..a22da20188 100644
> --- a/docs/manual/common-usage.txt
> +++ b/docs/manual/common-usage.txt
> @@ -326,7 +326,7 @@ Buildroot release, use the +size-stats-compare+ script. It takes two
>  Refer to the help text of this script for more details:
>  
>  ----------------
> -support/scripts/size-stats-compare -h
> +utils/size-stats-compare -h
>  ----------------
>  
>  include::eclipse-integration.txt[]
> diff --git a/docs/manual/developers.txt b/docs/manual/developers.txt
> index 3c31aa96fa..4e2cd71638 100644
> --- a/docs/manual/developers.txt
> +++ b/docs/manual/developers.txt
> @@ -26,7 +26,7 @@ to include in his patch the appropriate modification to the
>  The +DEVELOPERS+ file format is documented in detail inside the file
>  itself.
>  
> -The +get-developer+ tool, located in +support/scripts+ allows to use
> +The +get-developer+ tool, located in +utils/+ allows to use
>  the +DEVELOPERS+ file for various tasks:
>  
>  - When passing one or several patches as command line argument,
> -- 
> 2.13.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
