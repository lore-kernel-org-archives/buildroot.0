From: Tristan Lelong <blunderer@blunderer.org>
Date: Sat, 1 Feb 2014 14:30:44 -0800
Subject: [Buildroot] [PATCH] libroxml: bump version to 2.3.0
In-Reply-To: <20140201094537.69fb978d@skate>
References: <1391189802-5284-1-git-send-email-blunderer@blunderer.org>
 <20140201094537.69fb978d@skate>
Message-ID: <CAJb9USVBcJexbz3hcNCOpHTJpM6rD1dsEnDXKwtUp2PT-a0z=Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I will add this linking exception.

Regarding Documentation and tests, this is disabled by default, so we
shouldn't need anymore configuration option.

I'll resend the corrected patch.

Thanks


2014-02-01 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:

> Hello,
>
> On Fri, 31 Jan 2014 09:36:42 -0800, blunderer at blunderer.org wrote:
>
> > -LIBROXML_VERSION = 2.2.3
> > +LIBROXML_VERSION = 2.3.0
> >  LIBROXML_SITE = http://download.libroxml.net/pool/v2.x/
> >  LIBROXML_INSTALL_STAGING = YES
> > +LIBROXML_LICENSE = LGPLv2.1+
>
> Maybe we want to indicate the static linking exception, something like:
>
> LIBROXML_LICENSE = LGPLv2.1+ with static link exception
>
> Maybe you also want to disable the build of the documentation and the
> tests? I see that there are configuration options available for these
> in your configure.ac.
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>



-- 
618FE3EF
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140201/343f21d8/attachment.html>
