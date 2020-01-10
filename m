From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 10 Jan 2020 22:38:37 +0100
Subject: [Buildroot] [PATCH v1 1/2] package/snort: needs zlib
In-Reply-To: <20200110220719.3bcada58@windsurf>
References: <20200110172818.17155-1-ps.report@gmx.net>
 <20200110220719.3bcada58@windsurf>
Message-ID: <20200110223837.170e8e3f@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Fri, 10 Jan 2020 22:07:19 +0100, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> On Fri, 10 Jan 2020 18:28:17 +0100
> Peter Seiderer <ps.report@gmx.net> wrote:
>
> > Fixes:
> >
> >   checking zlib.h usability... no
> >   checking zlib.h presence... no
> >   checking for zlib.h... no
> >
> >      ERROR!  zlib header not found, go get it from
> >      http://www.zlib.net
> >
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
>
> Since when is zlib needed? We've add the snort package for quite some
> time. Is it due to the bump to 2.9.15 in December ?

No, I think it is a side effect of 'package/libpcap: remove unnecessary dependency
on zlib' ([1]) as snort selects/depends on libpcap...

Regards,
Peter

[1] https://git.buildroot.net/buildroot/commit/?id=fe4b9321e5ef3594776bba443d9718efd766f40e

>
> Thomas
