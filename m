From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 6 Mar 2021 14:46:34 +0100
Subject: [Buildroot] [PATCH v1] package/rust-bin: add i586 download hash
In-Reply-To: <20210306112307.28337-1-ps.report@gmx.net>
References: <20210306112307.28337-1-ps.report@gmx.net>
Message-ID: <20210306134634.GR2275@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2021-03-06 12:23 +0100, Peter Seiderer spake thusly:
> Fixes:
>   - https://bugs.busybox.net/show_bug.cgi?id=13576
>   ERROR: No hash found for rust-std-1.48.0-i586-unknown-linux-gnu.tar.xz

13576 contains a lot more issues, so even though this particular one is
indeed fixed, I've left the bug opened.

Applied to master, thanks! :-)

Regards,
Yann E. MORIN.

> Reported-by: ingineru_de_sistem at yahoo.com
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/rust-bin/rust-bin.hash | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/rust-bin/rust-bin.hash b/package/rust-bin/rust-bin.hash
> index cc3ea89b1f..46c023e62f 100644
> --- a/package/rust-bin/rust-bin.hash
> +++ b/package/rust-bin/rust-bin.hash
> @@ -16,6 +16,9 @@ sha256  5bc6c5dfcc9c345c3f7af519df8ac77c2b0938ea32aa7949f589bec2c7cd3a22  rust-s
>  # From https://static.rust-lang.org/dist/rust-std-1.48.0-armv7-unknown-linux-gnueabihf.tar.xz.sha256
>  # Verified using https://static.rust-lang.org/dist/rust-std-1.48.0-armv7-unknown-linux-gnueabihf.tar.xz.asc
>  sha256  da71ec82973eb6fdf67de25b5a39d9cb4b943ec2c43de570f4785a3a79036430  rust-std-1.48.0-armv7-unknown-linux-gnueabihf.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.48.0-i586-unknown-linux-gnu.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-std-1.48.0-i586-unknown-linux-gnu.tar.xz.asc
> +sha256  d700751756d9b6e7881dd3a5f67bec1b998b3e278a113f4de2125f4281deaf5c  rust-std-1.48.0-i586-unknown-linux-gnu.tar.xz
>  # From https://static.rust-lang.org/dist/rust-std-1.48.0-i686-unknown-linux-gnu.tar.xz.sha256
>  # Verified using https://static.rust-lang.org/dist/rust-std-1.48.0-i686-unknown-linux-gnu.tar.xz.asc
>  sha256  d4ea5ca6f9c8f9092b50c879f1d9a2620486f08020fa4cac227743a19f6e8cdf  rust-std-1.48.0-i686-unknown-linux-gnu.tar.xz
> -- 
> 2.30.1
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
