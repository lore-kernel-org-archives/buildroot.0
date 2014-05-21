From: Waldemar Brodkorb <wbx@openadk.org>
Date: Wed, 21 May 2014 07:58:01 +0200
Subject: [Buildroot] Status of your patches
In-Reply-To: <20140520141223.0e8a94f6@free-electrons.com>
References: <20140517111009.42385b15@free-electrons.com>
 <20140520141223.0e8a94f6@free-electrons.com>
Message-ID: <20140521055801.GE618@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
Thomas Petazzoni wrote,

> Spenser, Waldemar,
> 
> Any input on the below questions?

I don't think I am a microblaze expert.
Not sure I can help here.
 
> Thanks,
> 
> Thomas
> 
> On Sat, 17 May 2014 11:10:09 +0200, Thomas Petazzoni wrote:
> > Hello Spenser,
> > 
> > I'd like to get some update about the status of some of your patches in
> > patchwork, especially:
> > 
> >   http://patchwork.ozlabs.org/patch/314517/ [v2] gcc: coexist upstream with vendor git releases for mb and arc
> >   http://patchwork.ozlabs.org/patch/314518/ [v2] gdb: use git version for cross-gdb
> >   http://patchwork.ozlabs.org/patch/314512/ [v2] binutils: coexist upstream and vendor binutils for arc and microblaze
> >   http://patchwork.ozlabs.org/patch/314513/ [v2] libsigsegv: fix for microblaze
> >   http://patchwork.ozlabs.org/patch/314515/ [v2] glibc: change to tagged release
> >   http://patchwork.ozlabs.org/patch/314511/ [v2] binutils: change to tagged release
> >   http://patchwork.ozlabs.org/patch/314521/ [v2] gcc: change to tagged release
> >   http://patchwork.ozlabs.org/patch/314514/ [v2] gdb: change to tagged release
> > 
> > Most of these patches are related to the versions of Microblaze
> > toolchain components. But more recently, Waldemar has posted a patch
> > series to also update the Microblaze toolchain components, and his
> > series was merged.
> > 
> > Therefore, I'm wondering which parts of your series are still
> > necessary. Maybe Waldemar can also have a look and give us a status?

The gdb changes might be interesting. Another way would be a gdb patch
for 7.7 to make native debugging without single stepping working. 
It is a forward patch from Xilinx gdb repository. At least Rich
Felker (author of musl) used it to fix a microblaze specific bug.

best regards
        Waldemar
