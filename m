From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 25 Oct 2017 22:02:11 +0200
Subject: [Buildroot] [PATCH 00/13] New DL_DIR organisation;
 git cache feature
In-Reply-To: <CAGduivzECY1W5g-=eRt1NSXMWhLswu1_TGgRuCoUXWV9pMSGPw@mail.gmail.com>
References: <20170704162211.13238-1-maxime.hadjinlian@gmail.com>
 <20170728003756.3d675656@gmx.net>
 <CAGduivzEGzqMesGqkrKtchK3gDGVa9_3iOVzYZW2RFQfzbw4iw@mail.gmail.com>
 <20171017215649.492791d6@gmx.net>
 <CAGduivyAHYJQ43fGRqGyFBHvUHtqAqLXXz90_gH0nHM4R8+BSw@mail.gmail.com>
 <f078c060-2284-7f03-fa76-f7396abf5f80@mind.be>
 <CAGduivzECY1W5g-=eRt1NSXMWhLswu1_TGgRuCoUXWV9pMSGPw@mail.gmail.com>
Message-ID: <20171025220211.6298b7aa@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Maxime, Arnout,

On Mon, 23 Oct 2017 21:03:21 +0200, Maxime Hadjinlian <maxime.hadjinlian@gmail.com> wrote:

> On Mon, Oct 23, 2017 at 8:42 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> >
> >
> > On 23-10-17 20:24, Maxime Hadjinlian wrote:  
> >> Hi Peter,
> >>
> >> On Tue, Oct 17, 2017 at 9:56 PM, Peter Seiderer <ps.report@gmx.net> wrote:  
> >>> Hello Maxime,
> >>>
> >>> On Sun, 30 Jul 2017 18:32:27 +0200, Maxime Hadjinlian <maxime.hadjinlian@gmail.com> wrote:
> >>>  
> > [snip]  
> >>>> It's fixed on my branch on github for now.  
> >>> Any updates on this one? Mind to resend an actual version (would like to
> >>> see this feature integrated into buildroot, tired of waiting for hours
> >>> in case RaspberryPi kernel/firmware/userland git versions are updated)?  
> >> I think the most "up-to-date" is my branch on Github
> >> (https://github.com/maximeh/buildroot/tree/git_cache).
> >> I don't really think it's ready for a review, there's still many bugs
> >> in there, at least that's what I remember.
> >> What would really help me is, if you could test this and tell me what
> >> breaks so I could look it up and try to fix this, this would be a huge
> >> help !
> >> If you come up with patches, that's really nice too ;).
> >>
> >> I won't make any promises on the time I can spend on this, we all know
> >> how this goes.. but that being said, I am still really motivated by
> >> this feature, I really need it too.  
> >
> >  Maxime, correct me if I'm wrong, but you'd be happy if Peter does a respin of
> > the series, right?  
> Oh sure, for me, the important part is that it's merged, who gets to
> do is not. Since I clearly can't make the time to make it happen; if
> someone can respin this, then please do it :). At least the topic is
> out there :).
> >
> >  It would be nice if we could already apply the first few patches, just to keep
> > things going.  
> Agreed.

I will send out a v2 patch series of Maximes patches from github (with
a change log added), then hope to address some of Arnouts review comments (and
do some more testing) and will send out a v3 series the next days...

Regards,
Peter

> >
> >  Regards,
> >  Arnout
> >
> > --
> > Arnout Vandecappelle                          arnout at mind be
> > Senior Embedded Software Architect            +32-16-286500
> > Essensium/Mind                                http://www.mind.be
> > G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> > LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> > GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF  
