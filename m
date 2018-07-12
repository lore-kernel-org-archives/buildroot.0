From: Denis Kotov <redradist@gmail.com>
Date: Fri, 13 Jul 2018 01:05:44 +0300
Subject: [Buildroot] How to change compiler to newer in old build-root
In-Reply-To: <2097395198.3336152.1531394396552.JavaMail.zimbra@datacom.com.br>
References: <CAPKSe_6Q08-PYugmgAsGJ3waRGTWV2-V+vzT_KU5o7bk0fc58w@mail.gmail.com>
 <2097395198.3336152.1531394396552.JavaMail.zimbra@datacom.com.br>
Message-ID: <CAPKSe_7odb9UrbX6Oz9=CP-XLGXNek5GebNDj9GB5ieH66t1Vg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thank you Carlos for reply,

Okay, but what if I want to add newer compiler without changing buildroot
version from 2014 to 2017.
Is it possible ?

And if no how to switch to new version of buildroot automatically. Is it
possible ?

On Thu, 12 Jul 2018 at 14:19, Carlos Santos <casantos@datacom.com.br> wrote:

> > From: "Denis Kotov" <redradist@gmail.com>
> > To: "buildroot" <buildroot@busybox.net>
> > Sent: Thursday, July 12, 2018 4:58:09 AM
> > Subject: [Buildroot] How to change compiler to newer in old build-root
>
> > Hello everyone,
>
> > I am curious if I can change old gcc-4.8 compiler in buildroot-2014 to
> to gcc-7
> > ??
> > I have just replace name of compiler from gcc-4.8 to gcc-7, but failed
> with an
> > error:
>
> > >>> toolchain-external undefined Configuring
>
> > What did I wrong ?
>
> Support for GCC7 was introduced in Buildroot 2017.05:
>
> $ git --no-pager log --oneline -1 4314161159c
> 4314161159 package/gcc: add support for gcc 7
>
> $ git describe 4314161159c
> 2017.05-rc1-114-g4314161159
>
> --
> Carlos Santos (Casantos) - DATACOM, P&D
> ?Marched towards the enemy, spear upright, armed with the certainty
> that only the ignorant can have.? ? Epitaph of a volunteer
>


-- 

*Best RegardsDenis Kotov*
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180713/873657ef/attachment.html>
