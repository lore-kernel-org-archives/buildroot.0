From: Dmitry Golubovsky <golubovsky@gmail.com>
Date: Thu, 6 Sep 2012 09:35:49 -0400
Subject: [Buildroot] Autobuild and linux-pam failing to compile
In-Reply-To: <20120906151542.31796360@skate>
References: <CADiAo4KUj5s7UO8yZf5OcbY3VsaekJWNpjxSmpd8r_qf1MMJKQ@mail.gmail.com>
 <20120906151542.31796360@skate>
Message-ID: <CADiAo4JYh_L0tOOdYHKxM0ZdUwpaPpX_GeSTqQXKb-jKpVbvHA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Thu, Sep 6, 2012 at 9:15 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:

>
> All the external toolchains that are used on the Free Electrons build
> server are publicly available, so you can download them.

OK great. I'll try to reproduce this. A question however remains open:

>>> When using an external toolchain, is it possible to force a specific
>>> feature from within buildroot config?

From what I see in Buildroot's docs/config source, it is possible to
tell buildroot what a given toolchain supports, but nothing like NDBM
is on that list, am I correct?

And to my understanding, a toolchain is taken as preconfigured, and no
way to reconfigure it on the fly, right? I just never used external
toolchains so this part is not clear to me.

Anyway later tonight I'll get to this, so if there is any additional
info I can use I'd appreciate this.

> See also
> http://lists.busybox.net/pipermail/buildroot/2012-August/057876.html

Thanks, this is useful.

PS I have resubmitted a busybox-PAM patch with the recent suggestions
implemented (reorder patches, clarify the help message):

http://lists.busybox.net/pipermail/buildroot/2012-September/058295.html
and http://lists.busybox.net/pipermail/buildroot/2012-September/058296.html

Since I may need to patch PAM further to address the NDBM issue, I'd
be happier if these patches are applied (or if there is anything more
to fix I'd do that first).

Thanks.

-- 
Dmitry Golubovsky

Anywhere on the Web
