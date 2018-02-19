From: Waldemar Brodkorb <wbx@openadk.org>
Date: Mon, 19 Feb 2018 19:52:53 +0100
Subject: [Buildroot] [PATCH] m68k: add the real gcc bugfix from upstream
In-Reply-To: <20180219091108.45d6579d@windsurf.lan>
References: <20180218182151.GA5995@waldemar-brodkorb.de>
 <20180219091108.45d6579d@windsurf.lan>
Message-ID: <20180219185253.GL12535@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
Thomas Petazzoni wrote,

> Hello,
> 
> On Sun, 18 Feb 2018 19:21:52 +0100, Waldemar Brodkorb wrote:
> > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> 
> Thanks for following up on this! Do you consider this a change for
> "master" or for "next" ?

I think it might be safer to use it for next.
 
> It's a gcc change, so I would tend to be careful and take this only for
> the next branch. However, it's touching only m68k, so it's not like an
> issue is really going to affect a huge number of users.

Better we first see how it influences the autobuilders.

A backport might be possible later, if Peter's time permits it.

I started to use 4 digits patches, may be we should do it for the
existing patches?

best regards
 Waldemar
