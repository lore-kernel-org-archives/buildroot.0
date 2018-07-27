From: Adam Duskett <aduskett@gmail.com>
Date: Fri, 27 Jul 2018 17:39:57 -0400
Subject: [Buildroot] [PATCH 1/1] postgresql --with-libxml configure
 option added
In-Reply-To: <99413edb-b83b-6d16-327b-192bbf4c09be@mind.be>
References: <20180608062231.2345-1-dde@innovaphone.com>
 <F73717A01AEC1F4CB9A3D10E39CBB88F4424CD47@INNO-EX-2010.innovaphone.sifi>
 <F73717A01AEC1F4CB9A3D10E39CBB88F443662EA@INNO-EX-2010.innovaphone.sifi>
 <AD312B93A689234094FC24F3B98DBF33437A1708@INNO-EX-2010.innovaphone.sifi>
 <20180727093114.4943db9a@windsurf>
 <99413edb-b83b-6d16-327b-192bbf4c09be@mind.be>
Message-ID: <CAFSsvmqDUkMg4-=pQ94UR2Q7BynejSDT55HMq4WFYYmw4K4kpw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello;

Another nitpick I would have is that there should probably be a
Config.in entry for this as well.
On Fri, Jul 27, 2018 at 5:55 AM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 27-07-18 09:31, Thomas Petazzoni wrote:
> > Hello Thomas,
> >
> > On Fri, 27 Jul 2018 07:06:48 +0000, Thomas Ehrhardt wrote:
> >> The postgresql package is now built with --with-libxml if BR2_PACKAGE_LIBXML2 is selected to allow the use of XML functions in postgresql.
> >>
> >> Signed-off-by: Daniel Deterding <dde@innovaphone.com>
> >
> > Thanks for your patch, it looks good, but there's one issue: the From
> > doesn't match the Signed-off-by.
> >
> > If I understand correctly, the patch was done by your colleague Daniel
> > Deterding, and you are sending it on his behalf. If that is correct,
> > then you need to add your own Signed-off-by below the one from Daniel.
>
>  And you should also set the author to Daniel, e.g. with
>
> git commit --amend --author="Daniel Deterding <dde@innovaphone.com>"
>
>  Regards,
>  Arnout
>
> >
> > While you're at it, could you fix the minor issues below (I had fixed
> > them locally as I was about to apply the patch, but realized the
> > Signed-off-by issue) :
> >
> >  - The commit title should have the format:
> >
> >    <package>: <description>
> >
> >    A better commit title is:
> >
> >    postgresql: add optional dependency on libxml2
> >
> >  - The commit log text should be wrapped at 72 characters.
> >
> > Except these, it looks good. Could you resend an updated version ?
> >
> > Thanks a lot for your contribution!
> >
> > Thomas
> >
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
