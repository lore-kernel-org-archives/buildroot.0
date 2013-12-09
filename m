From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 9 Dec 2013 09:21:48 +0100
Subject: [Buildroot] [PATCH 3/4] systemd does not require glib
In-Reply-To: <1386547663-2678-3-git-send-email-shawn@churchofgit.com>
References: <1386547663-2678-1-git-send-email-shawn@churchofgit.com>
 <1386547663-2678-3-git-send-email-shawn@churchofgit.com>
Message-ID: <CAAXf6LVp8gUPRUu1dUNC_8WxjDegJjf6TTvvQ0+gnFoTsUSvvw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Dec 9, 2013 at 1:07 AM, Shawn Landden <shawn@churchofgit.com> wrote:
> Signed-off-by: Shawn Landden <shawn@churchofgit.com>
> ---
>  docs/manual/configure.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/docs/manual/configure.txt b/docs/manual/configure.txt
> index 8912a81..89df3d9 100644
> --- a/docs/manual/configure.txt
> +++ b/docs/manual/configure.txt
> @@ -371,7 +371,7 @@ can be chosen from +System configuration+, +Init system+:
>     etc. +systemd+ will be useful on relatively complex embedded
>     systems, for example the ones requiring D-Bus and services
>     communicating between each other. It is worth noting that +systemd+
> -   brings a fairly big number of large dependencies: +dbus+, +glib+
> +   brings a fairly big number of large dependencies: +dbus+, +udev+
>     and more. For more details about +systemd+, see
>     http://www.freedesktop.org/wiki/Software/systemd.

Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
