From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 1 Jul 2017 20:21:29 +0200
Subject: [Buildroot] [PATCH 1/1] utils/readme.txt: fix typos for
	size-stats-compare
In-Reply-To: <20170701180027.GY29444@argentina>
References: <20170701180027.GY29444@argentina>
Message-ID: <20170701182129.GE3593@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-07-01 20:00 +0200, Thomas De Schampheleire spake thusly:
> A few typos sneaked into the new utils readme...

Yup, sorry...

> Additionally, I formulated the list of use cases a bit differently.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
>  utils/readme.txt | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/utils/readme.txt b/utils/readme.txt
> index a90805fb0..fd20e8ee6 100644
> --- a/utils/readme.txt
> +++ b/utils/readme.txt
> @@ -28,10 +28,10 @@ scanpypi
>      a script to create a Buildroot package by scanning a PyPI package
>      description.
>  
> -size-stat-compare
> -    a script to compare the rootfs size between two differnt Buildroot
> +size-stats-compare
> +    a script to compare the rootfs size between two different Buildroot
>      configurations. This can be used to identify the size impact of
> -    a specific option, or of a set of specific options, or an update
> +    a specific option, of a set of specific options, or of an update

I still believe the current situation is prefereable, because it is :

the impact of
    - a specific option, or of a set of options,
  or
    - a new buildroot version

(use of the Oxford comma is very important, here! ;-] )

But yours is not completely incorrect either. ;-)

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

>      to a newer Buildroot version...
>  
>  test-pkg
> -- 
> 2.13.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
