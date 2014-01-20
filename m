From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 20 Jan 2014 22:44:28 +0100
Subject: [Buildroot] [PATCH v3 2/2] add support for building the server
In-Reply-To: <1390172539-5207-2-git-send-email-kuyurix@gmail.com>
References: <1390172539-5207-1-git-send-email-kuyurix@gmail.com>
 <1390172539-5207-2-git-send-email-kuyurix@gmail.com>
Message-ID: <20140120214428.GE3421@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Marcelo, All,

On 2014-01-19 23:02 +0000, Marcelo Guti?rrez spake thusly:
> From: "Marcelo Guti?rrez(UTN/FRH)" <kuyurix@gmail.com>

This one looks actually good to me! :-)

One minor nit, though:

This changelog:
> Changes v2 -> v3:
>         - rename field <number> in the patch file name
>         - update new options postion
>         - update description to Makefile
>         - update Config.in
> 
> Changes v1 -> v2:
>         - fix comments following new policy
>         - rename patches
>         - remove useless hook points
>         - add the URL to the home of MySQL
>         - add commit-log description to the patches
>         - install host tools to $(HOST_DIR)/usr/bin
>         - fix only builds the required program

should go...

> Signed-off-by: Marcelo Guti?rrez(UTN/FRH) <kuyurix@gmail.com>
> ---

Here, after the three-dash-line. git interprets this three-dash-line as
a marker for the end of the commit log, so it will not appear in the
history, since we don;t really need it.

(Ditto for your patch 1/2, too.)

Otherwise, looks good to me! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
