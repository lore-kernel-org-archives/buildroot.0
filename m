From: Brandon Maier <brandon.maier@rockwellcollins.com>
Date: Thu, 15 Nov 2018 14:42:41 -0600
Subject: [Buildroot] [PATCH 1/1] vmtouch: new package
In-Reply-To: <CANQCQpZKXv=FEnWcanoYsaY=C0kuebszbP=BxrWjkgKRGO4S8Q@mail.gmail.com>
References: <20181115174250.109988-1-brandon.maier@rockwellcollins.com>
 <CANQCQpZKXv=FEnWcanoYsaY=C0kuebszbP=BxrWjkgKRGO4S8Q@mail.gmail.com>
Message-ID: <CA+fik521q7Cot0UuW508nHeyAv=wyiOp2t1=kkV=r95+C8jm6Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Nov 15, 2018 at 2:07 PM Matthew Weber
<matthew.weber@rockwellcollins.com> wrote:
...
> >  package/Config.in                             |  1 +
>
> Care to add a DEVELOPERS entry for this one?

Sure, I'll add myself in v2

> > +VMTOUCH_VERSION = v1.3.0
>
> All your patches look like they are on the master branch.  Any reason
> not to track a hash as the version?  You may want to put in a issue
> ticket in the project's github tracker and request a release tag. As
> part of that request, mention you're adding the Buildroot package and
> would like to reference a tag vs a hash.
>

I wasn't sure if tracking an unreleased hash would be ok, but I can
resend with the patches removed and pointing at a hash. I opened a
Github ticket as well[1], if the developer makes one I'll bump to
that.

[1] https://github.com/hoytech/vmtouch/issues/70
