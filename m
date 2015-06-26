From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 27 Jun 2015 00:47:18 +0200
Subject: [Buildroot] [PATCH v6 12/16] package/opencv: add a choice for
 selecting the gui toolkit
In-Reply-To: <1435262397-888-13-git-send-email-s.martin49@gmail.com>
References: <1435262397-888-1-git-send-email-s.martin49@gmail.com>
 <1435262397-888-13-git-send-email-s.martin49@gmail.com>
Message-ID: <20150626224718.GH12470@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2015-06-25 21:59 +0200, Samuel Martin spake thusly:
> This patch moves the existing Qt4 and gtk2 options in that choice
> because, in OpenCV, only one toolkik will be actually used at the time,
> given priority to Qt4.
> 
> Suggested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
[--SNIP--]

And here's what I forgot:

> +comment "gtk2 depends on X.org and needs a toolchain w/ wchar, threads, C++"

    comment "gtk2 support needs X.org and a toolchain w/...."

OK, minor! ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
