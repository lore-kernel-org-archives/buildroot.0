From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 12 Jul 2016 13:08:31 +0200
Subject: [Buildroot] perl XS modules
In-Reply-To: <CAGhdn54==qiEj=ak+jtJ30_mD67tVn6YmBfx7wJ+Qipmx=++8Q@mail.gmail.com>
References: <20160708095910.621ad48a@gmail.com>
 <20160708174043.3e1b7d11@free-electrons.com>
 <CAGhdn55xFz6+4f46w3OLMwqUGvGv-mVgDLQzg8o07vWMcRQ3Pw@mail.gmail.com>
 <20160712101554.483fd170@gmail.com>
 <20160712105624.58817034@free-electrons.com>
 <20160712110438.62d56296@gmail.com>
 <CAGhdn54OkaYbb_WguDYBsdqkkOFXxA2rAsmSLYT_EL--qRGS7Q@mail.gmail.com>
 <20160712121627.433edea9@free-electrons.com>
 <CAGhdn54==qiEj=ak+jtJ30_mD67tVn6YmBfx7wJ+Qipmx=++8Q@mail.gmail.com>
Message-ID: <20160712130831.330d59f4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 12 Jul 2016 13:05:52 +0200, Fran?ois Perrad wrote:

> > Arne is not complaining about build problems, but about runtime
> > problems. Runtime problems are not detected by autobuild.buildroot.net.
> >
> After building, it's easy to test them:
>     # perl -MGD -e 1
>     ...

This involves booting the generated system on a target platform (or
Qemu), which is not currently supported by autobuild.b.o.

I did start an effort to add runtime tests for Buildroot, see
https://github.com/tpetazzoni/buildroot-runtime-test, but there's still
a lot of work that remains to be done.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
