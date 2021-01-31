From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 31 Jan 2021 16:03:57 -0300
Subject: [Buildroot] qt5 "Could not find DRM device"
In-Reply-To: <CAGshWo2DDqef=WG6MatpYHTxyNx=p4j+XxR-iEXSiE76anz4pw@mail.gmail.com>
References: <CAGshWo2DDqef=WG6MatpYHTxyNx=p4j+XxR-iEXSiE76anz4pw@mail.gmail.com>
Message-ID: <CAOMZO5AUFXJhy2Q7mh5OwtVu4PgLfU2KAMDMemDckq4VjDcK2w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Emmanuel,

On Sun, Jan 31, 2021 at 3:15 PM manu f <e.fiancette@gmail.com> wrote:
>
> Hello all,
>
> I build a kernel for imx6 board. imx6 boot correctly, but  I got this error  "Could not find DRM device" when I try to launch a qt web browser ( this app working on an other context).
>
> I search google and mailing list. I find something about qt5 configuration and -device flag..
> Could I have some help about ?
>
> (qt app depend on qt5 webengine, so I set mesa3d and perhaps I made a mistake when setting drivers, because I use direct frame buffer.. perhaps I forgot something)

I suggest you take a look at configs/imx6-sabresd_qt5_defconfig. This
target uses the mainline kernel and the Etnaviv stack.
