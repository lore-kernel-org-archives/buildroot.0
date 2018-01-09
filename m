From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Tue, 9 Jan 2018 15:03:15 +0000
Subject: [Buildroot] [PATCH] glibc: ARC is now supported via patches
In-Reply-To: <20180109155057.659c646b@windsurf>
References: <20171109215821.16615-1-abrodkin@synopsys.com>
 <20180101123936.609b7f41@windsurf> <1515506414.3868.7.camel@synopsys.com>
 <20180109155057.659c646b@windsurf>
Message-ID: <1515510195.3868.14.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, 2018-01-09 at 15:50 +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 9 Jan 2018 14:00:15 +0000, Alexey Brodkin wrote:

[snip]

> I guess the easiest approach is to keep using your fork from Github.
> It's up to you to decide what is the glibc version you want to use in
> Buildroot, so if you want to move to something that is closer to what
> is being submitted to glibc upstream, then that's perfectly fine: we
> can take a patch changing the glibc package to use a new ARC glibc
> version from Github.
> 
> Is that OK for you ?

Sure. Again I'm mostly concerned about things that will be fixed in
glibc's "stable" branch but still affecting our fork. But I'm sure we'll be able to
resolve it if it ever happens at all.

-Alexey
