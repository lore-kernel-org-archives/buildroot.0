From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 11 Jul 2019 21:02:33 +0200
Subject: [Buildroot] [PATCH v2 2/2] package/qt5: bump latest version to
 5.12.4
In-Reply-To: <891f19e9-a64b-c025-b5cd-f7a0517fbc35@mind.be>
References: <20190710173645.15459-1-ps.report@gmx.net>
 <20190710173645.15459-2-ps.report@gmx.net>
 <891f19e9-a64b-c025-b5cd-f7a0517fbc35@mind.be>
Message-ID: <20190711210233.0b7eb0aa@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout,

On Thu, 11 Jul 2019 00:12:59 +0200, Arnout Vandecappelle <arnout@mind.be> wrote:

> On 10/07/2019 19:36, Peter Seiderer wrote:
> > qt5multimedia:
> > - remove 0001-Fix-compile-failure-with-gstreamer-0-10.patch (taken from
> >   upstream [1])
>
>  For some reason, this gave a conflict for me...
>
> >
> > qt5webengine:
> > - add one additional license hash
> >   (src/3rdparty/chromium/third_party/blink/renderer/build/scripts/license.pyc)
> >
> > [1] https://code.qt.io/cgit/qt/qtmultimedia.git/commit/?id=935967a453b47ae7c8e9ad3d94eef3813eab58db
> >
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
>
>  Applied to master, thanks.
>
>  Do you know if this also fixes Bug 11776 [1] for qt5webengine? Apparently the
> bump to 5.13 should fix it, but I guess 5.12.4 probably fixes it too.

No, the bug still exists with 5.12.4....

>
>  By the way, do we stick to 5.12.x or do we bump to 5.13 (for 2019.08)? If we
> bump, it would be nice to have that bump soonish... Still, it's good to have
> this 5.12.4 bump first because that can be backported to 2019.05.

Will prepare the bump to 5.13.0 the next (few) weeks ;-), the question is how
to proceed:

- keep LTS 5.6 (Standard Support Until 16.03.2019, according to [2]), bump Latest to 5.13
- bump LTS 5.6 to LTS 5.9 (Standard Support Until 31.05.2020), bump Latest to 5.13
- bump LTS 5.6 to LTS 5.12 (Standard Support Until 2021), bump Latest to 5.13
- drop LTS, only support Latest

Regards,
Peter

[2] https://en.wikipedia.org/wiki/Qt_version_history

>
>  Regards,
>  Arnout
>
> [1] https://bugs.busybox.net/show_bug.cgi?id=11776
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
