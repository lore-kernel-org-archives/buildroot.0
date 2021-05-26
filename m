From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 26 May 2021 23:43:26 +0200
Subject: [Buildroot] [PATCH/next 0/2] Enable more openssl features for
 hostapd/wpa_supplicant
In-Reply-To: <20210526195635.127744-1-geomatsi@gmail.com>
References: <20210526195635.127744-1-geomatsi@gmail.com>
Message-ID: <20210526214326.GR3208066@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sergey, All,

On 2021-05-26 22:56 +0300, Sergey Matyukevich spake thusly:
> Hi all,
> 
> One more openssl crypto feature needs to be enabled for hostapd
> and wpa_supplicant. Last time it was MD4, now it is DES.
> 
> Regards,
> Sergey
> 
> Sergey Matyukevich (2):
>   package/wpa_supplicant: enable DES in openssl
>   package/hostapd: enable DES in openssl

Applied to next, thanks.

Regards,
Yann E. MORIN.

>  package/hostapd/Config.in        | 1 +
>  package/wpa_supplicant/Config.in | 1 +
>  2 files changed, 2 insertions(+)
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
