From: Christopher McCrory <chrismcc@gmail.com>
Date: Wed, 8 Aug 2018 18:05:26 -0700
Subject: [Buildroot] PERL/CGI: Can not install CGI.pm via buildroot
In-Reply-To: <b4402969-4507-6e3a-6fe4-54b40e331acb@mind.be>
References: <1533652691.994785035@f468.i.mail.ru>
 <b4402969-4507-6e3a-6fe4-54b40e331acb@mind.be>
Message-ID: <CALURroSDTEWNDmZTfQTrOaW-miu1evpU40AHr4cm-JNVMMKOsg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello

Sorry for top posting, on my phone.

I have a perl CGI package ( via scancpan ), I can post tomorrow.

FWIW, I'm working on packaging zoneminder and have 35 ish perl- packages
that could be added.

On Wed, Aug 8, 2018, 1:47 PM Arnout Vandecappelle <arnout@mind.be> wrote:

>
>
> On 07-08-18 16:38, ***** ***** wrote:
> >
> > I use buildroot   2018.2 and perl by default version is 5.26.2.
> > I need a module CGI.pm that is contained in perl version 5.20.2.
> > I replace .mk and hash files in package/perl for 5.20.2 version
> > Complie project -- all right. But I can not looking the CGI.pm anywhere
> in linux
> > system.
>
>  See [1] - CGI.pm was removed from perl because it's not the right way to
> do it.
> If you really need it, you have to get the package from cpan. You can use
> the
> utils/scancpan script to get started.
>
>  Regards,
>  Arnout
>
>
> [1]
> https://metacpan.org/pod/CGI#CGI.pm-HAS-BEEN-REMOVED-FROM-THE-PERL-CORE
>
> >
> > What I did wrong?
> >
> >
> --------------------------------------------------------------------------------
> >
> > --
> > ***** *****
> >
> >
> --------------------------------------------------------------------------------
> >
> > --
> > *** ***
> >
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
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
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180808/b386c2ba/attachment.html>
