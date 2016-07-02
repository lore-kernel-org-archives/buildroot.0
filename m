From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Jul 2016 18:50:51 +0200
Subject: [Buildroot] [PATCH] package/samba4: Change tmpfiles path
In-Reply-To: <1467476491-6900-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1467476491-6900-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20160702185051.2c720ea5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  2 Jul 2016 18:21:31 +0200, Maxime Hadjinlian wrote:
> Per the documentation:
> https://www.freedesktop.org/software/systemd/man/tmpfiles.d.html
> 
> The order of path by priorites is:
> /etc/tmpfiles.d/*.conf
> /run/tmpfiles.d/*.conf
> /usr/lib/tmpfiles.d/*.conf
> 
> For the user to be able to override our tmpfiles easily, it's better to
> place our files in /usr/lib/tmpfiles.d/
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/samba4/samba4.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
