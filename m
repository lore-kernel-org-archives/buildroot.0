From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Nov 2017 18:06:29 +0100
Subject: [Buildroot] [PATCH 1/1] Allow adding per-package overrlice
 rsync exclusions
In-Reply-To: <20171108144635.GB28359@momiji>
References: <20171107015730.20311-1-aperez@igalia.com>
 <04ece7d7-8192-2029-5edc-63ae48bb7532@mind.be>
 <20171107220503.179cc727@windsurf> <20171108144635.GB28359@momiji>
Message-ID: <20171108180629.6f7d418b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 8 Nov 2017 14:46:35 +0200, Adrian Perez de Castro wrote:

> > Also my thinking: per-package out of tree build is going to make this
> > new feature a lot less relevant. That being said, per-package out of
> > tree build is not there yet, and this new feature is just a very simple
> > change, so I believe it's OK to merge it.  
> 
> How about packages which do not support out-of-tree builds? Wouldn't it still
> be useful to be to define additional rsync flags for them? 

Indeed, packages that don't support out of tree build will continue
using rsync, and therefore it makes sense to have this exclusion thing.

> > I think we really want the documentation update as part of the patch
> > series :)  
> 
> Good point, I'll add add the edit for the manual as well and submit a new
> version of the patch.

Thanks :)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
