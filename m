From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 4 Dec 2013 22:29:17 +0100
Subject: [Buildroot] [git commit] tvheadend: fix typo in patch
	description
In-Reply-To: <20131204094013.455149BF07@busybox.osuosl.org>
References: <20131204094013.455149BF07@busybox.osuosl.org>
Message-ID: <20131204212916.GA3332@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, Thomas, All,

On 2013-12-04 10:39 +0100, Peter Korsgaard spake thusly:
> commit: http://git.buildroot.net/buildroot/commit/?id=ff51f3734b905a09d75960d8b67c233bede1af3a
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  .../tvheadend-004-dont-run-compiled-code.patch     |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/package/tvheadend/tvheadend-004-dont-run-compiled-code.patch b/package/tvheadend/tvheadend-004-dont-run-compiled-code.patch
> index f559583..8125db1 100644
> --- a/package/tvheadend/tvheadend-004-dont-run-compiled-code.patch
> +++ b/package/tvheadend/tvheadend-004-dont-run-compiled-code.patch
> @@ -2,7 +2,7 @@ support: don't try to run compiled code
>  
>  When cross-compiling, we can't run the compiled code.
>  
> -Consider the compiler returning succes as an indication
> +Consider the compiler returning success as an indication
>  it is working.

Thanks to both of you for fixing this. :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
