From: Waldemar Brodkorb <wbx@uclibc-ng.org>
Date: Mon, 21 Jul 2014 21:23:49 +0200
Subject: [Buildroot] [OpenWrt-Devel] uClibc-ng
In-Reply-To: <CAGVrzcZxcgP+yerqW=1ZDrmgiFmOz9eTwFB2KvZ6Xt2MJpbpDA@mail.gmail.com>
References: <20140720191326.GD4431@waldemar-brodkorb.de>
 <CAGVrzcZxcgP+yerqW=1ZDrmgiFmOz9eTwFB2KvZ6Xt2MJpbpDA@mail.gmail.com>
Message-ID: <20140721192348.GJ4431@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Florian,
Florian Fainelli wrote,

> Hello,
> 
> (adding uclibc and Bernhard)
> 
> 2014-07-20 12:13 GMT-07:00 Waldemar Brodkorb <wbx@uclibc-ng.org>:
> > Hello Embedded Linux Hackers,
> >
> > it seems there is no plan to release a new uClibc version.
> > The current maintainer does not response on any public or private mails
> > about a plan to do a needed release. Therefore most of you carrying a lot
> > of patches against uClibc 0.9.33.2 to make it work in your project.
> > A really ugly situation.
> 
> Although I do welcome your action, and stepping in to offer a solution
> to this, I feel like forking might have the potential of making this
> situation worse, including, but not limited to:
> 
> - creating confusion between uclibc and uclibc-ng

What kind of confusion. uClibc-ng frontpage clearly states it is a
spin-off of uClibc.

> - pissing off Bernhard

May be I am already pissed off by him? In the past I send a patch
for mips64 n64 with no answer. After a ping a month later it got
applied. A bug report about broken sparc support never got a
response. Public mails of the buildroot project missing a release
got ignored. A private mail from me to Eric and Bernhard, response
from Eric that he is no longer involved, no answer from Bernhard.
So the selective answers of Bernhard are a problem, at least for me.

> - duplicating existing infrastructure instead of gaining access to it

I asked Bernhard if he wants to give up maintainership.

> - what if you end up in the same situation as uClibc, we all have busy lives?

So what is the situation of uClibc? The problem is lack of
communication. I would be fine if Bernhard would answer any mails
regarding non-technical issues with uClibc. A short mail "I am busy,
no release this year." would be at least a fair statement.
Or "I am very busy, having a new job, can someone make a release?"
 
> Thomas and I talked to Khem Raj about this uClibc situation during ELC
> back in June, and Khem offered some help to see if we could:
> 
> - make Bernhard aware of the lack of release situation
> - use his uclibc.org access to facilitate a 0.9.34? release

Nothing happened. Should I whine another year on the mailinglist
about a new release?
As an old OpenBSD user I am following:
Shutup and hack!
 
best regards
 Waldemar
