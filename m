From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Oct 2016 15:10:11 +0200
Subject: [Buildroot] Webtool to analyze package build fail/pass from
	autobuild
In-Reply-To: <1476882214.26312.22.camel@synopsys.com>
References: <EB86EB452ADE4B44B294F7149B8A277702219383@DE02WEMBXB.internal.synopsys.com>
 <1476882214.26312.22.camel@synopsys.com>
Message-ID: <20161019151011.68cc5079@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 19 Oct 2016 13:04:04 +0000, Alexey Brodkin wrote:

> > As this tools have been proven to be of great value to us, perhaps you
> > would feel the same.
> > The code is shared in:
> > https://github.com/foss-for-synopsys-dwc-arc-processors/buildroot_stats
> > 
> > Looking forward for your feedback.?  
> 
> I'm wondering if there's any interest in proposed thing from your side?

Yes, sorry for not replying earlier. Recent times have been busy with
ELCE and the Buildroot meeting. It definitely looks interesting, but I
want to take a closer look before giving some detailed feedback.

> We may indeed deploy it on some public server and encourage people
> to start using that but I'm not sure if there's a point in adding
> "3rd-party" services around?http://autobuild.buildroot.net/?instead
> of enhancing autobuild server itself.

Fully agreed.

Though one initial issue is that Cupertino wrote his logic in Ruby
(which I don't really read/write). The existing autobuild.buildroot.net
code base is some horrible PHP crap that I wrote. I'm hoping to rewrite
that crap someday, but definitely not in Ruby, but rather in Python,
which is more widely used in the Buildroot community than Ruby, and
also a language that I happen to read/write (even though my Python-fu
is really basic, it's good enough for this kind of stuff).

But I guess this is just an implementation detail, and we can work in
bringing Cupertino's logic in autobuild.buildroot.net somehow.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
