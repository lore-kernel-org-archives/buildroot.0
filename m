From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 17 Aug 2020 23:15:15 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Analysis of build results
In-Reply-To: <20200816000914.5ad801d9@windsurf.home>
References: <20200815080146.EBD3186EA1@fraxinus.osuosl.org>
 <20200816000914.5ad801d9@windsurf.home>
Message-ID: <20200817231515.581c1518@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas, *,

On Sun, 16 Aug 2020 00:09:14 +0200, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> >   aarch64    |       qt5wayland-5.15.0        | NOK | http://autobuild.buildroot.net/results/f673d4bd730b029bda29357f0b1442cc22475895 |
>
> Checking for wayland-scanner... yes
> Checking for EGL 1.5 with Wayland Platform... no
> Project ERROR: Test config.qtwayland_client.tests.dmabuf-server-buffer tries to use undeclared library 'drm'
>
> Meh :/

Known problem, reported upstream (see [1]) and hack/workaround suggested ([2])...

Regards,
Peter

[1] https://bugreports.qt.io/browse/QTBUG-83303
[2] https://codereview.qt-project.org/c/qt/qtwayland/+/296213
