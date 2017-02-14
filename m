From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 14 Feb 2017 10:30:52 -0200
Subject: [Buildroot] [PATCH v2] kmscube: Add new package
In-Reply-To: <20170214091803.70ab8d9a@free-electrons.com>
References: <1487011784-24966-1-git-send-email-festevam@gmail.com>
 <20170213223117.0125c14e@free-electrons.com>
 <CAOMZO5Dwdu5-+bV=TXA6=-wg+=W05BhE1eEYhzZk6zV71MUBdA@mail.gmail.com>
 <20170214091803.70ab8d9a@free-electrons.com>
Message-ID: <CAOMZO5Cpsd38C6Trnzb_CZjRkkYK3EniDc9c=4KdY3VNRyvObQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, Feb 14, 2017 at 6:18 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:

> I would do just:
>
>         depends on BR2_PACKAGE_MESA3D_OPENGL_EGL
>         depends on BR2_PACKAGE_MESA3D_OPENGL_ES

Got it. I can do like this.

What about KMSCUBE_DEPENDENCIES? Currently I have:
KMSCUBE_DEPENDENCIES = host-pkgconf libdrm mesa3d

Should this be adjusted to something different?

Thanks
