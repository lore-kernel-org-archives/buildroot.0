From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Fri, 15 May 2020 21:17:08 +0200
Subject: [Buildroot] [PATCH] package/openvpn: add option to use mbed TLS
 instead of OpenSSL
In-Reply-To: <CACm0Nn1Fs9KfqWvEMSVXgCXePOViXXBW1TfNziL_56hvzWfs_w@mail.gmail.com>
References: <20200511223108.4184-1-edo.rus@gmail.com>
 <CACm0Nn1Fs9KfqWvEMSVXgCXePOViXXBW1TfNziL_56hvzWfs_w@mail.gmail.com>
Message-ID: <CAEyMn7YVKNrXVFXu0oS5J6QyVPrT9KF8zHrw4BnYcLKjrSZyFg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ed,

Am Fr., 15. Mai 2020 um 19:30 Uhr schrieb Ed Spiridonov <edo.rus@gmail.com>:

> On Tue, May 12, 2020 at 1:31 AM Ed Spiridonov <edo.rus@gmail.com> wrote:
> >
> > Since 2.4 version, OpenVPN can be built using mbeb TLS as it's
> > crypto backend, instead of OpenSSL.
> >
> > About 2 Mb of uncompressed image size can be saved by replacing
> > OpenSSL with mbed TLS.
>
> Is anybody interested in this patch?
> I'm going to publish another patch to make some features optional
> (server side, multihome, etc), but I guess it will be ignored like
> this one.
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot


I think the maintainers are busy preparing the upcoming release. And on the
other hand the backlog [1] is full with more than 400 pending patches.

So please be patient ;-/

[1] https://patchwork.ozlabs.org/project/buildroot/list/
-- 
Heiko
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200515/0d35b63e/attachment.html>
