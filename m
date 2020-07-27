From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Mon, 27 Jul 2020 21:50:09 +0200
Subject: [Buildroot] [PATCH v3 2/7] board/guest: documentation and
 sample files
In-Reply-To: <87sgdduw79.fsf@dell.be.48ers.dk>
References: <20200621080000.180089-1-francois.perrad@gadz.org>
 <20200621080000.180089-3-francois.perrad@gadz.org>
 <87sgdduw79.fsf@dell.be.48ers.dk>
Message-ID: <CAB0FRsupwxeqQp7RNfDMETSO-8X8Q=z8tY-Yh+io6zR4mkcc1g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le lun. 27 juil. 2020 ? 11:46, Peter Korsgaard <peter@korsgaard.com> a
?crit :

> >>>>> "Francois" == Francois Perrad <fperrad@gmail.com> writes:
>
>  > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
>  > ---
>  >  DEVELOPERS             |   1 +
>  >  board/guest/Dockerfile |   2 +
>  >  board/guest/readme.txt | 143 +++++++++++++++++++++++++++++++++++++++++
>  >  3 files changed, 146 insertions(+)
>  >  create mode 100644 board/guest/Dockerfile
>  >  create mode 100644 board/guest/readme.txt
>
> ..
>
>  > +How to with Docker
>  > +==================
>  > +
>  > +A Docker image could created with a Dockerfile and few commands are
> needed:
>  > +
>  > +    # dockerd &
>  > +
>  > +    $ cat Dockerfile
>  > +    FROM scratch
>  > +    ADD rootfs.tar /
>  > +    $ docker build --tag br:guest .
>  > +    $ docker images
>  > +    REPOSITORY          TAG                 IMAGE ID
> CREATED             SIZE
>  > +    br                  guest               0c54c85a3452        42
> seconds ago      1.75MB
>
> NIT: Why not just use docker import rootfs.tar br:test?
>

Good point.

Fran?ois


>
> --
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200727/55df6638/attachment.html>
