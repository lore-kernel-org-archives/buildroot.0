From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 23 Mar 2012 10:19:55 +0100
Subject: [Buildroot] [PATCH 1/2] New package: socketcand
In-Reply-To: <20120323101652.1f1b4b33@skate>
References: <1332428460-28459-1-git-send-email-yegorslists@googlemail.com>
 <87ehsk1c2d.fsf@macbook.be.48ers.dk> <20120323095538.5edb8eea@skate>
 <4F6C3D20.8050304@visionsystems.de> <20120323101652.1f1b4b33@skate>
Message-ID: <CAGm1_ktGv_x0AN2f0kUTzaQjoaiSXFSEfbyOb9n7vU0zjMGtUQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Mar 23, 2012 at 10:16 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Le Fri, 23 Mar 2012 10:06:40 +0100,
> Yegor Yefremov <yegor_sub1@visionsystems.de> a ?crit :
>
>> What do you suggest?
>
> Fixup the Makefile.in to use install instead of cp. That will remove
> all the useless mkdir and such. You can even contribute this change to
> the upstream project I think.
>
> No 'make install' ever cares about overwriting existing files, I don't
> see why the one of socketcand should.
>
> What do you think about this option?

I agree with you. I'll make a patch and contact the maintainer.

Yegor
