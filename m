From: Laurentiu-Cristian Duca <laurentiu.duca@gmail.com>
Date: Fri, 21 Jun 2019 16:32:58 +0300
Subject: [Buildroot] wmctrl fails on Xorg with openbox
In-Reply-To: <CAPm8-H6XgEngMNEVmUP0WCWbJikLW23m7dYEpyJuPfv_4OZdcQ@mail.gmail.com>
References: <CAPm8-H6XgEngMNEVmUP0WCWbJikLW23m7dYEpyJuPfv_4OZdcQ@mail.gmail.com>
Message-ID: <CAPm8-H7pTygJpxEpgXEUXuJKMi5orAbBNWxxAX215Dr3JyK97Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It works, it was my fault because I thought openbox starts by default,
but I had to run it manually in order wmctrl to work.

Thank you
and Kind regards!

On 6/21/19, Laurentiu-Cristian Duca <laurentiu.duca@gmail.com> wrote:
> Hello buildroot community,
>
>   I am facing the following problem on Raspberry Pi
> when using buildroot with Xorg and openbox window manager:
>
> # wmctrl -m
> Cannot get window manager info properties.
> (_NET_SUPPORTING_WM_CHECK or _WIN_SUPPORTING_WM_CHECK)
>
> # wmctrl -l
> Cannot get client list properties.
> (_NET_CLIENT_LIST or _WIN_CLIENT_LIST)
>
>   This happens with Xorg running while the wmctrl command is launched:
> - it happens from an xterm window
> - it also happens when launching wmctrl from /etc/X11/xinit/xinitrc
>
>   I have also tested wmctrl
> on a Ubuntu 18.0 system and works perfectly.
>
>   Any ideas on how to get it work?
>
>
> Thank you,
> L-C. Duca
>
