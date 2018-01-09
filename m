From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Jan 2018 16:05:18 +0100
Subject: [Buildroot] [PATCH] glibc: ARC is now supported via patches
In-Reply-To: <1515510195.3868.14.camel@synopsys.com>
References: <20171109215821.16615-1-abrodkin@synopsys.com>
 <20180101123936.609b7f41@windsurf>
 <1515506414.3868.7.camel@synopsys.com>
 <20180109155057.659c646b@windsurf>
 <1515510195.3868.14.camel@synopsys.com>
Message-ID: <20180109160518.31e2fd01@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 9 Jan 2018 15:03:15 +0000, Alexey Brodkin wrote:

> > Is that OK for you ?  
> 
> Sure. Again I'm mostly concerned about things that will be fixed in
> glibc's "stable" branch but still affecting our fork. But I'm sure we'll be able to
> resolve it if it ever happens at all.

You could always rebase your fork once in a while, or merge the glibc
stable branch.

We are also not updating every day the glibc commit we're using for the
glibc package, so we're also not getting fixes every day.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
