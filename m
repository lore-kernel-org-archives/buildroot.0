From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Nov 2019 10:24:17 +0100
Subject: [Buildroot] [PATCH 1/1] package/dtc: bump version to 1.5.1
In-Reply-To: <2e17e96615b10c843fa81e291fedc48749bd98c0.1573797870.git.sbobroff@linux.ibm.com>
References: <2e17e96615b10c843fa81e291fedc48749bd98c0.1573797870.git.sbobroff@linux.ibm.com>
Message-ID: <20191117092417.GF32494@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sam, All,

On 2019-11-15 17:04 +1100, Sam Bobroff spake thusly:
[--SNIP--]
> diff --git a/package/dtc/dtc.hash b/package/dtc/dtc.hash
> index 4d0aaea601..3adfcc45a9 100644
> --- a/package/dtc/dtc.hash
> +++ b/package/dtc/dtc.hash
> @@ -1,5 +1,5 @@
>  # from https://www.kernel.org/pub/software/utils/dtc/sha256sums.asc
> -sha256 c672e443c9f7e39f5a7c8e602da6777f9ad55ad70de87de300a43828c8050172  dtc-1.5.0.tar.xz
> +sha256 660b74039690fc37013660544d09191834efb58503c73c555c5513ba75ab031f  dtc-1.5.1.tar.xz
>  
>  # Hash for license files
>  sha256 171ce1c292cf148a5be9ff95ce7e5c3d79a002721ab8e119eae3c0f5336d2b3d  README.license

You forgot to update the license hash:

    http://autobuild.buildroot.org/results/799bddc1467413b1f202a8803e902c797f4f9c92

I've nowre-applied the correcticve patch from Fabrice, that was already
also reverted when we reverted the previous bump to 1.5.1, and pushed it
to next.

Next time, don't forget to run 'make legal-info'. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
