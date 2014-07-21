From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Jul 2014 20:42:39 +0200
Subject: [Buildroot] [OpenWrt-Devel] uClibc-ng
In-Reply-To: <CAGVrzcZxcgP+yerqW=1ZDrmgiFmOz9eTwFB2KvZ6Xt2MJpbpDA@mail.gmail.com>
References: <20140720191326.GD4431@waldemar-brodkorb.de>
 <CAGVrzcZxcgP+yerqW=1ZDrmgiFmOz9eTwFB2KvZ6Xt2MJpbpDA@mail.gmail.com>
Message-ID: <20140721204239.61b225fe@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Florian Fainelli,

On Mon, 21 Jul 2014 11:23:46 -0700, Florian Fainelli wrote:

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
> - pissing off Bernhard
> - duplicating existing infrastructure instead of gaining access to it
> - what if you end up in the same situation as uClibc, we all have busy lives?
> 
> Thomas and I talked to Khem Raj about this uClibc situation during ELC
> back in June, and Khem offered some help to see if we could:
> 
> - make Bernhard aware of the lack of release situation
> - use his uclibc.org access to facilitate a 0.9.34? release

ELC was end of April, early May, and Khem told me he would act with one
month. I've pinged him several times, and nothing happened. He might
have been too afraid to piss off Bernhard.

On my side, I fully support Waldemar's fork. The last uClibc release is
more than 2 years old, and Bernhard has never been answering to *any*
of the e-mails asking to do a release, sent since September 2013 or so.
At this point, I think there is absolutely no hope to see any action
being done by the existing uClibc community in terms of doing stable
releases, and this case, the lever that open-source licenses provide is
simple: fork. That's what Waldemar has done, and it's good.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
