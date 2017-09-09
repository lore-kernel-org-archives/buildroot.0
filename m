From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 9 Sep 2017 17:38:34 +0200
Subject: [Buildroot] [PATCH] aiccu: delete package
In-Reply-To: <A478F1A5-E69B-48E1-8FA4-324A46C701BC@gmail.com>
References: <20170909092510.4119-1-alexander.i.mukhin@gmail.com>
 <A478F1A5-E69B-48E1-8FA4-324A46C701BC@gmail.com>
Message-ID: <20170909153834.GA2850@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alexander, All,

On 2017-09-09 13:09 +0300, Alexander Mukhin spake thusly:
> As SixXS project has ceased its operation on 2017-06-06, consider removing aiccu package.
> Signed-off-by: Alexander Mukhin <alexander.i.mukhin@gmail.com>
[--SNIP--]
> index a2d610017..000000000
> --- a/package/aiccu/Config.in
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -config BR2_PACKAGE_AICCU
> -    bool "aiccu"

Please add an entry in Config.in.legacy.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
