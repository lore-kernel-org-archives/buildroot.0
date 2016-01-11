From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 11 Jan 2016 23:40:46 +0100
Subject: [Buildroot] [PATCH v3 1/1] package/libgsm: new package
In-Reply-To: <1430072810-27772-1-git-send-email-bernd.kuhls@t-online.de>
References: <1430072810-27772-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160111224046.GE4257@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2015-04-26 20:26 +0200, Bernd Kuhls spake thusly:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v3: - fixed typo
> v2: - added hash
>     - updated 0001-cross.patch to reflect libgsm version
>     - added license info (Thomas)
>     - optimized license infos (Thomas)
> 
>  package/Config.in               |    1 +
>  package/libgsm/0001-cross.patch |  205 +++++++++++++++++++++++++++++++++++++++
>  package/libgsm/Config.in        |    6 ++
>  package/libgsm/libgsm.hash      |    2 +
>  package/libgsm/libgsm.mk        |   41 ++++++++

So I've added that patch to my series adding asterisk, and I've reworked
it a bit.

Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
