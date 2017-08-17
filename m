From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Aug 2017 09:47:51 +0200
Subject: [Buildroot] Analysis of build results for 2017-08-14
In-Reply-To: <9a1b8d71-d39b-dc8b-fa95-dbeb6f1213b4@mind.be>
References: <20170815063102.ED3612091A@mail.free-electrons.com>
 <20170815142032.329e8103@windsurf>
 <865c6d16-fd88-294e-2fea-62cf312fbacb@mind.be>
 <20170816225324.331fec56@windsurf>
 <9a1b8d71-d39b-dc8b-fa95-dbeb6f1213b4@mind.be>
Message-ID: <20170817094751.5df88b1f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 17 Aug 2017 00:48:10 +0200, Arnout Vandecappelle wrote:

> > So if it was just the Sourcery toolchain being unable to build
> > ruby-2.4.1, I think we would have a lot more failures than that. So it
> > might be a toolchain issue, but that occurs under very specific
> > conditions.  
> 
>  ruby has a bunch of optional dependencies, so yes indeed it only occurs for
> some exotic combination of these dependencies.
> 
>  So I checked the source of the Sourcery toolchain and it does NOT have the
> patch of bug 20006 applied, even though it was released in binutils 2.26.1, 4
> months before the Sourcery release...
> 
>  So, we could try to find out which exact combination of packages triggers this
> issue, but is that worth it for something that happens twice in five months...

True, but it's annoying to have those sporadic failures once in a
while :-/

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
