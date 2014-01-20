From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 20 Jan 2014 22:45:48 +0100
Subject: [Buildroot] [PATCH 1/2] Rename MySQL client package
In-Reply-To: <1390172539-5207-1-git-send-email-kuyurix@gmail.com>
References: <1390172539-5207-1-git-send-email-kuyurix@gmail.com>
Message-ID: <20140120214548.GF3421@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Marcelo, All,

On 2014-01-19 23:02 +0000, Marcelo Guti?rrez spake thusly:
> From: "Marcelo Guti?rrez(UTN/FRH)" <kuyurix@gmail.com>
> 
> Signed-off-by: Marcelo Guti?rrez(UTN/FRH) <kuyurix@gmail.com>
> ---
>  Config.in.legacy                                   |    7 +
>  package/Config.in                                  |    2 +-
>  package/mysql/Config.in                            |   14 ++
>  package/mysql/mysql-ac_cache_check.patch           |  156 ++++++++++++++++++++
>  package/mysql/mysql-configure-ps-cache-check.patch |   39 +++++
>  package/mysql/mysql-use-new-readline-iface.patch   |   21 +++
>  package/mysql/mysql.mk                             |   48 ++++++
>  7 files changed, 286 insertions(+), 1 deletion(-)
>  create mode 100644 package/mysql/Config.in
>  create mode 100644 package/mysql/mysql-ac_cache_check.patch
>  create mode 100644 package/mysql/mysql-configure-ps-cache-check.patch
>  create mode 100644 package/mysql/mysql-use-new-readline-iface.patch
>  create mode 100644 package/mysql/mysql.mk

Oh, I forgot: you should also rename the patches so they have a number.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
