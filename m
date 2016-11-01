From: Cupertino Miranda <Cupertino.Miranda@synopsys.com>
Date: Tue, 1 Nov 2016 15:56:38 +0000
Subject: [Buildroot] Webtool to analyze package build fail/pass from
	autobuild
References: <EB86EB452ADE4B44B294F7149B8A277702219383@DE02WEMBXB.internal.synopsys.com>
 <1476882214.26312.22.camel@synopsys.com>
 <20161019151011.68cc5079@free-electrons.com>
Message-ID: <EB86EB452ADE4B44B294F7149B8A2777022237C4@DE02WEMBXB.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas and everyone,

I understand your concerns with Ruby.
However, please allow me to try to demystify it a little.

The problem with either Python or Ruby languages its not necessarily the
language itself, but the frameworks created around specific topics (like
web development) that make code seem magical.
This will not change if you decide to go a different path and
re-implement in Python, PHP, or any other language.
To efficiently be able to do this websites I did my own learning during
years in Ruby and some frameworks.

Unfortunately, I will not be able to contribute to this in other
language, as it would involve too much effort to learn other framework,
and as you know this is not my main topic. :-)
Please notice I am in no way a web developer, and I am sure there is
plenty of people capable to do a better job than myself.

Nevertheless, in my humble opinion, unless there is someone with greater
experience doing this kind of projects in Python, or any other language,
in the mailing list, I would not advise to delay improving this tools
because of a language limitation.

What I would like to propose would be to contribute a new web framework,
in parallel with the existing one.
This way nothing will be lost and you can always fall back to the
previous version.
Moreover, I already have managerial approval to offer myself as a
maintainer up until someone else fells comfortable with Ruby and its
frameworks and everything is stabilized.

Looking forward for your feedback.

Best regards,
Cupertino

On 10/19/2016 03:10 PM, Thomas Petazzoni wrote:
> Fully agreed.
>
> Though one initial issue is that Cupertino wrote his logic in Ruby
> (which I don't really read/write). The existing autobuild.buildroot.net
> code base is some horrible PHP crap that I wrote. I'm hoping to rewrite
> that crap someday, but definitely not in Ruby, but rather in Python,
> which is more widely used in the Buildroot community than Ruby, and
> also a language that I happen to read/write (even though my Python-fu
> is really basic, it's good enough for this kind of stuff).
>
> But I guess this is just an implementation detail, and we can work in
> bringing Cupertino's logic in autobuild.buildroot.net somehow.
>
> Thanks,
