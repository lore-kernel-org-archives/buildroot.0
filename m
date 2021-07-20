From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 20 Jul 2021 08:15:42 +0200
Subject: [Buildroot] [PATCH] package/libmbim: bump to version 1.24.8
In-Reply-To: <20210716225449.382c1426@windsurf>
References: <20210712091827.335522-1-aleksander@aleksander.es>
 <20210716225449.382c1426@windsurf>
Message-ID: <CAGm1_kuFhe7U+qYMRiPP2htmfCDR4kmOKFaX0Vnsfh0XvSQVUA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Aleksander, All,

On Fri, Jul 16, 2021 at 10:54 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Mon, 12 Jul 2021 11:18:27 +0200
> Aleksander Morgado <aleksander@aleksander.es> wrote:
>
> > https://lists.freedesktop.org/archives/libmbim-devel/2021-June/001151.html
> >
> > Signed-off-by: Aleksander Morgado <aleksander@aleksander.es>
> > ---
> >  package/libmbim/libmbim.hash | 2 +-
> >  package/libmbim/libmbim.mk   | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
>
> Applied to master, thanks.

I still experience this error [1]. Any ideas?

I have also applied libgudev patches as their build was failing.

[1] http://autobuild.buildroot.net/results/f8a81aad0e262a567a2b31712575472ae92e5518/build-end.log

Best regards,
Yegor
