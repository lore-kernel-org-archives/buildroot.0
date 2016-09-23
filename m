From: Biagio Montaruli <biagio.hkr@gmail.com>
Date: Fri, 23 Sep 2016 10:01:04 +0200
Subject: [Buildroot] [PATCH 1/1] configs/acmesystems_arietta_g25: update
 kernel and at91bootstrap3
In-Reply-To: <20160923080709.6df7cdb2@free-electrons.com>
References: <1474555439-3059-1-git-send-email-biagio.hkr@gmail.com>
 <20160923080709.6df7cdb2@free-electrons.com>
Message-ID: <CAJkBjxHg2246yi7JKfzx6cjYzmkNzeSRQHB452vMg0mXz7inVA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

You're welcome !

2016-09-23 8:07 GMT+02:00 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:

> Hello,
>
> On Thu, 22 Sep 2016 16:43:59 +0200, Biagio Montaruli wrote:
> > - configs/acmesystems_arietta_g25_128mb_defconfig,
> >   configs/acmesystems_arietta_g25_256mb_defconfig :
> >   update default configuration files for both 128MB and 256MB version
> >
> > - board/acmesystems/arietta-g25/genimage.cfg
> >   board/acmesystems/arietta-g25/post-image.sh :
> >   improve 'post-image.sh' and 'genimage.cfg' used to build sdcard.img
> >
> > - board/acmesystems/arietta-g25/readme.txt :
> >   update documentation for Arietta G25
> >
> > Signed-off-by: Biagio Montaruli <biagio.hkr@gmail.com>
> > ---
> >  board/acmesystems/arietta-g25/genimage.cfg      | 12 ++++-----
> >  board/acmesystems/arietta-g25/post-image.sh     |  4 +--
> >  board/acmesystems/arietta-g25/readme.txt        | 14 ++++++----
> >  configs/acmesystems_arietta_g25_128mb_defconfig | 36
> ++++++++++++++-----------
> >  configs/acmesystems_arietta_g25_256mb_defconfig | 36
> ++++++++++++++-----------
> >  5 files changed, 58 insertions(+), 44 deletions(-)
>
> Applied to master, thanks.
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160923/61207120/attachment.html>
