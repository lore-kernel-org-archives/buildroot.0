From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon, 29 Jun 2015 12:36:57 +0000
Subject: [Buildroot] [PATCH] ARC: switch to RC1 of upcoming arc-2015.06
 tools
In-Reply-To: <20150627092110.GI31780@waldemar-brodkorb.de>
References: <1435346840-9677-1-git-send-email-abrodkin@synopsys.com>
 <20150627092110.GI31780@waldemar-brodkorb.de>
Message-ID: <1435581416.30996.19.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Waldemar,

On Sat, 2015-06-27 at 11:21 +0200, Waldemar Brodkorb wrote:
> Is there any reason uClibc-ng 1.0.3 can not be used as default?
> Do you have pending patches for ARC?

Even thought there's no strong preference for us between uClibc and
uClibc-ng the point is we've been using our GitHub uClibc repo (which
is now a "mirror" of uClibc's git with a bit of a lag in updates - we
do it manually from time to time) for all builds, i.e. we run
regression tests and use for building everything uClibc but not uClibc
-ng. And so we're pretty sure uClibc works for us.

I'm not saying that uClibc-ng is any worse, no. But for current release
cycle we'll claim support of "vanilla" uClibc.

But I believe it's a good time now to discuss a possibility to switch
to uClibc-ng for our following releases.

I'm explicitly adding Vineet in Cc who is our uClibc maintainer so he
may add his 2 cents in that discussion.

-Alexey
