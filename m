From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Mar 2017 23:38:31 +0100
Subject: [Buildroot] [PATCH 13/25] package/Config.in: explain that lua
 package names should start with lua
In-Reply-To: <ee995d97-dc1e-41c1-a828-3bee82d30b4b@mind.be>
References: <20170223170047.24417-1-arnout@mind.be>
 <20170223170047.24417-14-arnout@mind.be>
 <20170302225033.4c38fbab@free-electrons.com>
 <a9a0a363-1c91-c50a-6f5d-a058c8fd4e4b@mind.be>
 <20170302232226.7566b105@free-electrons.com>
 <ee995d97-dc1e-41c1-a828-3bee82d30b4b@mind.be>
Message-ID: <20170302233831.21c0b34e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 2 Mar 2017 23:26:16 +0100, Arnout Vandecappelle wrote:

> > Fair enough, but then I'd like that the rule be:
> > 
> >  * If the upstream package name is luafoo, then it should be luafoo in
> >    Buildroot.
> > 
> >  * If the upstream package name is foo, then it should be lua-foo in
> >    Buildroot.
> > 
> > Does that sound OK?  
> 
>  That's exactly what I meant. Should I update the Config.in?

Yes, would be nice. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
