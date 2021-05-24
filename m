From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 24 May 2021 15:23:13 +0200
Subject: [Buildroot] [PATCH v3 0/2] Update to latest libsoup2
In-Reply-To: <20210521103737.3802646-1-aperez@igalia.com>
References: <20210521103737.3802646-1-aperez@igalia.com>
Message-ID: <20210524132313.GA3208066@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adrian, All,

On 2021-05-21 13:37 +0300, Adrian Perez de Castro spake thusly:
> Hello all,
> 
> While working on the WebKit package updates the last days I noticed that the
> version of libsoup2 in Buildroot is a tad old, and it seemed fitting to submit
> a patch set for updating it. Recent versions have a new dependency on libpsl,
> so a new package for it is added as well.
> 
> Cheers,
> -Adrian
> 
> Adrian Perez de Castro (2):
>   package/libpsl: new package
>   package/libsoup: bump to version 2.66.5

Series of two applied to next, thanks.

Regards,
Yann E. MORIN.

>  DEVELOPERS                                    |  1 +
>  package/Config.in                             |  1 +
>  package/libpsl/Config.in                      |  8 ++++++
>  package/libpsl/libpsl.hash                    |  6 +++++
>  package/libpsl/libpsl.mk                      | 27 +++++++++++++++++++
>  .../0001-Revert-tld-parser-use-Python-3.patch | 27 -------------------
>  package/libsoup/Config.in                     |  1 +
>  package/libsoup/libsoup.hash                  |  4 +--
>  package/libsoup/libsoup.mk                    | 20 +++++++-------
>  9 files changed, 56 insertions(+), 39 deletions(-)
>  create mode 100644 package/libpsl/Config.in
>  create mode 100644 package/libpsl/libpsl.hash
>  create mode 100644 package/libpsl/libpsl.mk
>  delete mode 100644 package/libsoup/0001-Revert-tld-parser-use-Python-3.patch
> 
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
