From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 Sep 2018 09:28:29 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
 2018-09-14
In-Reply-To: <CALURroTZCjCkEw5-CjQDLju74tZqO2nkcPuT0KwG0UVq7YBEAA@mail.gmail.com>
References: <20180915060039.36CDD207B0@mail.bootlin.com>
 <CALURroTZCjCkEw5-CjQDLju74tZqO2nkcPuT0KwG0UVq7YBEAA@mail.gmail.com>
Message-ID: <20180918092829.721f3c54@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Adding Buildroot mailing list in Cc.

On Mon, 17 Sep 2018 08:57:06 -0700, Christopher McCrory wrote:

> >          arc |           perl-data-uuid-1.221 |
> > http://autobuild.buildroot.net/results/c5ba7b0727131220b60a4dc78fc7491dd4f7af9e
> >      aarch64 |           perl-data-uuid-1.221 |
> > http://autobuild.buildroot.net/results/5dd93ef9f5146227b8233ada260d5945aa8632d0
> >       x86_64 |  perl-io-socket-multicast-1.12 |
> > http://autobuild.buildroot.net/results/824119c86a1ddcbad39d4d4e9fe61eba20a55f3f
>
> I did a build with one of these configs and couldn't reproduce the error.
> IIRC, There was a patch to perl to fix these.  yes?
> 

Yes, these issues were fixed by

https://git.buildroot.org/buildroot/commit/package/pkg-perl.mk?id=45076af4930fda83c8898254de2d7c5fe3c15911

If you see any of those issues after commit
45076af4930fda83c8898254de2d7c5fe3c15911, then we have a separate
problem that needs to be investigated.

Best regards, 

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
