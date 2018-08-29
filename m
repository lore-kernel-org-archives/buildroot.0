From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 29 Aug 2018 22:03:18 +0200
Subject: [Buildroot] [PATCH 1/2] python-mimeparse: new package
In-Reply-To: <20180829214603.1bc17321@windsurf>
References: <20180828101618.4746-1-grzegorz@blach.pl>
 <20180829214603.1bc17321@windsurf>
Message-ID: <CAGm1_kvP=qy6DJGv6KVxngN8FEeTjqfj-yGSkbC6umHSnuN8vQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Aug 29, 2018 at 9:46 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> Another small nit that I realized afterwards and fixed, see below.
>
> On Tue, 28 Aug 2018 12:16:17 +0200, Grzegorz Blach wrote:
>
> > +PYTHON_MIMEPARSE_SOURCE = python-mimeparse-$(PYTHON_MIMEPARSE_VERSION).tar.gz
>
> This is the default value of the _SOURCE variable, defined by the
> python-package infrastructure when _SOURCE is not provided. Therefore,
> there is no need to specify the _SOURCE variable in this case. This is
> detected by our check-package checker:
>
> package/python-mimeparse/python-mimeparse.mk:8: remove default value of _SOURCE variable
>
> Yegor: scanpypi should be fixed to not emit the _SOURCE variable in
> this case.

OK.

Yegor

> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
