From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <fperrad@gmail.com>
Date: Tue, 12 Jul 2016 13:05:52 +0200
Subject: [Buildroot] perl XS modules
In-Reply-To: <20160712121627.433edea9@free-electrons.com>
References: <20160708095910.621ad48a@gmail.com>
 <20160708174043.3e1b7d11@free-electrons.com>
 <CAGhdn55xFz6+4f46w3OLMwqUGvGv-mVgDLQzg8o07vWMcRQ3Pw@mail.gmail.com>
 <20160712101554.483fd170@gmail.com>
 <20160712105624.58817034@free-electrons.com>
 <20160712110438.62d56296@gmail.com>
 <CAGhdn54OkaYbb_WguDYBsdqkkOFXxA2rAsmSLYT_EL--qRGS7Q@mail.gmail.com>
 <20160712121627.433edea9@free-electrons.com>
Message-ID: <CAGhdn54==qiEj=ak+jtJ30_mD67tVn6YmBfx7wJ+Qipmx=++8Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2016-07-12 12:16 GMT+02:00 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:

> Hello,
>
> On Tue, 12 Jul 2016 11:43:49 +0200, Fran?ois Perrad wrote:
>
> > Could you try to build a package like perl-gd or perl-net-ssleay, in
> order
> > to verify your infrastructure ?
> > These packages are known to build on autobuild.buildroot.net .
>
> Arne is not complaining about build problems, but about runtime
> problems. Runtime problems are not detected by autobuild.buildroot.net.
>
>
After building, it's easy to test them:
    # perl -MGD -e 1
    ...

Fran?ois


> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160712/dfc21e80/attachment.html>
