From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 5 Feb 2020 14:12:14 +0100
Subject: [Buildroot] QtWebEngine on RPI 0 W
In-Reply-To: <1580902462241-0.post@n4.nabble.com>
References: <1579861270269-0.post@n4.nabble.com>
 <20200125172550.45366ce5@gmx.net>
 <1580197267384-0.post@n4.nabble.com>
 <20200128085828.5959e493@gmx.net> <20200128104326.030b51d9@gmx.net>
 <1580384329954-0.post@n4.nabble.com>
 <20200130132047.5d82cab0@gmx.net>
 <1580734278053-0.post@n4.nabble.com>
 <1580902462241-0.post@n4.nabble.com>
Message-ID: <20200205141214.075cf5a3@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Rafa,

On Wed, 5 Feb 2020 05:34:22 -0600 (CST), rscr <rafacrespiramon@gmail.com> wrote:

> Hi again,
>
> I have tested the QtWebEngine with a qt example and I got:
>
> # ./minimal -platform eglfs
> Illegal instruction
>
> Any idea of what could be causing it?

Hard to say without further information..., did your compile
minimal yourself or did you enable 'BR2_PACKAGE_QT5BASE_EXAMPLES=y'
and used the one installed as '/usr/lib/qt/examples/webenginewidgets/minimal/minimal'
on the target?

Please provide a complete .config (or defconfig) file...

Still using buildroot-2019.02.09?

Regards,
Peter

>
> Kind Regards
>
> Rafa
>
>
>
> --
> Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
