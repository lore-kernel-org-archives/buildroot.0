From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 7 Feb 2015 23:00:11 +0100
Subject: [Buildroot] [PATCH 14/16] package/util-linux: add more tool
 select options
In-Reply-To: <1421684056-5266-15-git-send-email-maxtram95@gmail.com>
References: <1421684056-5266-1-git-send-email-maxtram95@gmail.com>
 <1421684056-5266-15-git-send-email-maxtram95@gmail.com>
Message-ID: <20150207220011.GA32583@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxim, All,

On 2015-01-19 18:14 +0200, Maxim Mikityanskiy spake thusly:
> Add more options to Config.in to allow optionally select or deselect
> util-linux tools.
> 
> Also fix s/BR2_PACKAGE_WDCTL/BR2_PACKAGE_UTIL_LINUX_WDCTL/
[--SNIP--]
> -config BR2_PACKAGE_WDCTL
> +config BR2_PACKAGE_UTIL_LINUX_WDCTL

BR2_PACKAGE_WDCTL should have been added to config.in.legacy to provide
backward compatibility with previos .config/defconfig files.
 I'll submit a patch for that in a momemnt.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
