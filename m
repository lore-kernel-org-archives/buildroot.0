From: Matthew Weber <matthew.weber@collins.com>
Date: Tue, 21 Jul 2020 15:08:48 -0500
Subject: [Buildroot] [PATCH 1/1] package/libnids: NVD database has been
 updated
In-Reply-To: <20200721204324.58fa9cc2@windsurf.home>
References: <20200721180555.31453-1-guillaume.bressaix@gmail.com>
 <20200721204324.58fa9cc2@windsurf.home>
Message-ID: <CANQCQpb3NtawUS-fGVDXn+jfvjS2mh1T--r815m8jsnSj0wYHw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ugh, looks like they only updated the description and didn't adjust the
rest of the version references

https://nvd.nist.gov/vuln/detail/CVE-2010-0751#match-5471142

On Tue, Jul 21, 2020 at 1:46 PM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> On Tue, 21 Jul 2020 20:05:55 +0200
> guillaume.bressaix at gmail.com wrote:
>
> > From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
> >
> > Thanks to Matthew W. & Thomas, the NVD database has been updated
> > and CVE-2010-0751 is now declared fixed, see
> > https://security-tracker.debian.org/tracker/CVE-2010-0751
> >
> > Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
>
> Are you sure it has already been fixed ?
>
> https://nvd.nist.gov/vuln/detail/CVE-2010-0751 still marks 1.24 as
> affected as far as I can see.
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200721/6efdf37f/attachment.html>
