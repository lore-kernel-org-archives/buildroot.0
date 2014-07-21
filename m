From: Waldemar Brodkorb <wbx@uclibc-ng.org>
Date: Mon, 21 Jul 2014 19:51:27 +0200
Subject: [Buildroot] uClibc-ng
In-Reply-To: <CA+icZUWU7ApasykCEU=2O_+wNF7=QKP3LBEXLMjHcguwQbOS_g@mail.gmail.com>
References: <20140720191326.GD4431@waldemar-brodkorb.de>
 <CA+icZUWU7ApasykCEU=2O_+wNF7=QKP3LBEXLMjHcguwQbOS_g@mail.gmail.com>
Message-ID: <20140721175127.GI4431@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sedat,
Sedat Dilek wrote,

> On Sun, Jul 20, 2014 at 9:13 PM, Waldemar Brodkorb <wbx@uclibc-ng.org> wrote:
> > Hello Embedded Linux Hackers,
> >
> > it seems there is no plan to release a new uClibc version.
> > The current maintainer does not response on any public or private mails
> > about a plan to do a needed release. Therefore most of you carrying a lot
> > of patches against uClibc 0.9.33.2 to make it work in your project.
> > A really ugly situation.
> >
> 
> I have seen some patches got in uClibc upstream some weeks ago (-> inactivity).

I didn't go so far to say uClibc is dead, it is just totally unclear
when the next release is planned.

> But anyway, a 1st try...
> Look at OpenSSL and LibreSSL... Might be we see some competition or
> rebirth starting here, too?

Dunno, time will show.
 
> My POV (from my experiences) is most embedded projects are not really
> interested in upstream work or keep their own patches (this seems to
> be easier).
> An example:
> Recently, I pointed to [0], but the maintainer of the project did not
> give any feedback to Bernd (requested a simple S-o-b).
> What I want to say it is not only a problem of the uClibc maintainer :-).

I think most embedded projects try to push their local patches to
upstream. At least buildroot does it a lot and I try to do it if
time permits. In your example the uClibc maintainer could also just
add the patch and mention where he has got it from. Or should the
known bug should just be ignored, because of a missing S-o-b?
 
> From my experiences successful projects do regular releases (6 months
> or a year).
> What are your plans?

A good mantra: Release early, release often.
I have no plans doing regular releases every static time period.
Just if it make sense.
 
> > To get out of this situation I started a spin-off called uClibc-ng.
> > The website for the project is here: http://www.uclibc-ng.org
> > Beta 3 is tagged and downloadable via
> > http://downloads.uclibc-ng.org/uClibc-ng-1.0.0beta3.tar.xz
> >
> 
> Do you plan a browsable Git website, where someone can look at the
> source via webbrowser?

Trac has it included:
http://www.uclibc-ng.org/browser/uClibc-ng
Or:
http://www.openadk.org/cgi-bin/gitweb.cgi?p=uClibc-ng.git;a=summary
 
> OK, you have now an infrastructure...
> Do you have people (developers, users) behind you :-)?

No. Just me. I am using it for my OpenADK project. I published the
stuff so others might benefit from it. Some buildroot and OpenWrt
devs were interested.
 
> > If you want a 1.0 in the near future please test and report back any
> > issues. You can use the bug tracker, the mailing list or dicussion forum
> > to report back. To prevent spam you need to be subscribed or registered.
> >
> > I have added most of the patches from your projects on top of uClibc
> > master.
> >
> 
> Did you look also at the patches [1] from the Freetz project?

Yes. I wanted to inform the freetz project, but I didn't find a
mailinglist or the mail adresses of the main contributors.
Most of the patches are either backports from git master or from
OpenWrt. I hope the rest might get contributed by the freetz people
with some meta-information, what kind of problem is fixed by a
patch.

best regards
 Waldemar
 
