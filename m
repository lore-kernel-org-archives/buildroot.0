From: Alexander Khryukin <alexander@mezon.ru>
Date: Fri, 9 Nov 2012 20:19:51 +0300
Subject: [Buildroot] [PATCH] gnutls-2.12.20-glibc-2.16.patch glibc-2.16
 and gnutls2 fix i forgot my signoff
In-Reply-To: <CAHXCMMLpVAHmvEHdpkyorLHb=DJGmHhG6cnWkpZ0pkfEp5Sg9g@mail.gmail.com>
References: <1352464266-22684-1-git-send-email-alexander@mezon.ru>
 <CAHXCMMLpVAHmvEHdpkyorLHb=DJGmHhG6cnWkpZ0pkfEp5Sg9g@mail.gmail.com>
Message-ID: <CABtOAfyJB5Px6+69ej4_1cALv+_rXstdrcQ813Cd8zzYzghTMQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2012/11/9 Samuel Martin <s.martin49@gmail.com>

> Hi Alexander,
>
> 2012/11/9 Alexander Khryukin <alexander@mezon.ru>:
> >
> > Signed-off-by: Alexander Khryukin <alexander@mezon.ru>
> > ---
> >  package/gnutls/gnutls-2.12.20-glibc2.16.patch | 26
> ++++++++++++++++++++++++++
> >  1 file changed, 26 insertions(+)
> >  create mode 100644 package/gnutls/gnutls-2.12.20-glibc2.16.patch
> >
> > diff --git a/package/gnutls/gnutls-2.12.20-glibc2.16.patch
> b/package/gnutls/gnutls-2.12.20-glibc2.16.patch
> > new file mode 100644
> > index 0000000..6b7f545
> > --- /dev/null
> > +++ b/package/gnutls/gnutls-2.12.20-glibc2.16.patch
> > @@ -0,0 +1,26 @@
> > +--- gnutls-2.12.20/gl/stdio.in.h
> > ++++ gnutls-2.12.20/gl/stdio.in.h
> When adding a patch to a package, we usually add a header to the patch
> containing a description and the SoB line.
>
> Regards,
>
> --
> Sam
>


Looks as my mistake.
In a short time i'll send good patch.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121109/9678e105/attachment-0001.html>
