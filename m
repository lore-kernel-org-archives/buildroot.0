From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Wed, 10 Aug 2016 13:49:15 +0200
Subject: [Buildroot] issue with the QT5, buildroot 2016-05
In-Reply-To: <CAMWiJUuY5YGP10m6P-aHcdyuiewq+AdRU8MByGN5Kb4NLvNi3Q@mail.gmail.com>
References: <CAMWiJUuY5YGP10m6P-aHcdyuiewq+AdRU8MByGN5Kb4NLvNi3Q@mail.gmail.com>
Message-ID: <CAAMH-ys7xLR53fBoooGp4hueEsCPu+FzYT7YUA54V8E43vX81Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Zhaozhou,

On Wed, Aug 10, 2016 at 1:23 PM, Zhaozhou Meng <mengzhaozhou@gmail.com> wrote:
> Hi all,
>
> I use the buildroot 2016.05 version, the board nitrogen6x with cpu imx6 and
> the u-boot 2016.03 version.
> I built the QT5.6 with eglfs, opengl es2 without X11, when I run the
> examples on the board, I found that some example works perfectly, but some
> example doesn't work, like opengl/cube with the error :
> "audit: type=1701 audit(1455208187.550:2): auid=4294967295 uid=0 gid=0
> ses=429491
> Segmentation fault (core dumped)"

Are the other examples that are working using the GPU 3D as well?
Is the galcore module properly inserted?
Are the Vivante demos running properly?
Have you tried the Qt5Cinex demo?

> The same error also happened for my own QT project compiled with buidlroot
> qmake.
> I don't know if you have the same problems,

Not that I remember but I didn't test all the examples. I usually
install the Qt5Cinex demo which stresses the GPU pretty well.

Regards,
Gary
