From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 24 Nov 2019 20:21:19 +0100
Subject: [Buildroot] [PATCH 1/1] package/systemd: fix license hash
In-Reply-To: <20191124190728.667661-1-fontaine.fabrice@gmail.com>
References: <20191124190728.667661-1-fontaine.fabrice@gmail.com>
Message-ID: <20191124192119.GI32494@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2019-11-24 20:07 +0100, Fabrice Fontaine spake thusly:
> Bump to 243.4 forgot to update hash of README file
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/eae13046b90253cdb2bf260e10b316386dff4eb1
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, after adding a note about why README was changed.
Thanks.

Regards,
Yann E. MORIN.

> ---
>  package/systemd/systemd.hash | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
> index 4c126d3755..584198d14b 100644
> --- a/package/systemd/systemd.hash
> +++ b/package/systemd/systemd.hash
> @@ -2,4 +2,4 @@
>  sha256	281bc47aa6b173c3c6fa1bbc88aea84ecb014313aeb679c54f8885dd09e434be	systemd-243.4.tar.gz
>  sha256	ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6	LICENSE.GPL2
>  sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	LICENSE.LGPL2.1
> -sha256	3a3b3cbd0ef03c7045bfda9b61062bdc33ad4913b44a6b6147043f26d00b51bf	README
> +sha256	ff5a9e3791e3a941a2d85b5ef7ad7c01441dd42f4c760bff2c8b086c7d764885	README
> -- 
> 2.24.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
