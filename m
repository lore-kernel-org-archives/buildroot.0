From: Adrian Perez de Castro <aperez@igalia.com>
Date: Tue, 20 Feb 2018 17:51:16 +0000
Subject: [Buildroot] [PATCH v2 1/3] package/llvm: new host package
In-Reply-To: <CALoSW64Qopg9Z--Ty_RbXfrYV2Lu_Vnxrx+zewO4xqS-jQSsDg@mail.gmail.com>
References: <20180219171805.13769-1-valentin.korenblit@smile.fr>
 <20180219171805.13769-2-valentin.korenblit@smile.fr>
 <20180219212213.33f289c4@windsurf.home>
 <8d272d0a-d3bc-b9c9-6cfc-ca1164cc7032@smile.fr>
 <CALoSW6517hOpJqRgUPcVkbG+hpso1VcOagOrhxG4nqtLHg=D9Q@mail.gmail.com>
 <20180220134111.0807307e@windsurf>
 <CALoSW64Qopg9Z--Ty_RbXfrYV2Lu_Vnxrx+zewO4xqS-jQSsDg@mail.gmail.com>
Message-ID: <20180220175116.GD29004@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 20 Feb 2018 12:41:04 -0500, Nimai Mahajan <nimaim@gmail.com> wrote:
> On Tue, Feb 20, 2018 at 7:41 AM, Thomas Petazzoni <
> thomas.petazzoni at bootlin.com> wrote:
> 
> > Hello,
> >
> > On Tue, 20 Feb 2018 12:13:54 +0000, Nimai Mahajan wrote:
> >
> > > I can test this today at work, but I am using the same target
> > architecture
> > > as you, x86. We use this sw rasturizer with a Qt5 app on an old atom
> > > platform (that has no modern kernel support for hw accelerated graphics).
> >
> 
> Tested! Works just fine on x86. Pulled in BR master, applied the 3 patches
> successfully, LLVM builds, mesa3d builds and links against it properly.

FWIW, in cases like this could you please add a ?Tested-by? tag to your reply,
so the tags get picked by the review system (thanks!).

For more info on this, there's a section in the manual about tags used by
the Buildroot project:

  https://buildroot.org/downloads/manual/manual.html#_reviewing_and_testing_patches
 
Cheers,

--
 Adri?n ?
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180220/134439e5/attachment.asc>
