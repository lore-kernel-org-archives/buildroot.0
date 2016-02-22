From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 23 Feb 2016 00:08:28 +0100
Subject: [Buildroot] [PATCH] owfs: new package
In-Reply-To: <20160222233719.55228a26@free-electrons.com>
References: <1456173419-32284-1-git-send-email-arnout@mind.be>
 <20160222233719.55228a26@free-electrons.com>
Message-ID: <56CB94EC.6030705@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On 02/22/16 23:37, Thomas Petazzoni wrote:
> Arnout,
>
> On Mon, 22 Feb 2016 21:36:59 +0100, Arnout Vandecappelle
> (Essensium/Mind) wrote:
>
> > diff --git a/package/owfs/0001-configure.ac-check-for-localtime_r.patch
> b/package/owfs/0001-configure.ac-check-for-localtime_r.patch
> > new file mode 100644
> > index 0000000..bdaab4f
> > --- /dev/null
> > +++ b/package/owfs/0001-configure.ac-check-for-localtime_r.patch
> > @@ -0,0 +1,48 @@
> > +From dd7c906a7e548ccb7b9c101221531d6b203f701f Mon Sep 17 00:00:00 2001
> > +From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
> > +Date: Sun, 21 Feb 2016 17:02:06 +0100
> > +Subject: [PATCH] configure.ac: check for localtime_r
> > +
> > +HAVE_LOCALTIME_R is used in module/owftpd/src/c/file_list.c, so it
> > +should be checked for.
> > +
> > +Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> > +---
> > + configure.ac                   | 2 +-
> > + module/swig/python/setup.py.in | 7 -------
> > + 2 files changed, 1 insertion(+), 8 deletions(-)
>
> Your description explains perfectly well the change in configure.ac,
> but does not explain the change done in setup.py.in. Shouldn't it be
> part of a separate patch, with a proper description ?

 Oops, that's a leftover from my failed attempt to get python3 to work.

 Regards,
 Arnout

>
> The rest of the patch looks good.
>
> Thanks!
>
> Thomas
>

-- 
Arnout Vandecappelle arnout dot vandecappelle at essensium dot com
Senior Embedded Software Architect . . . . . . +32-478-010353 (mobile)
Essensium, Mind division . . . . . . . . . . . . . . http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium . . . . . BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint: 7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
