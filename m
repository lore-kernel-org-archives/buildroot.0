From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 25 Sep 2020 09:03:17 +0200
Subject: [Buildroot] [RFC v1 12/13] package/gstreamer1-editing-services:
 bump version to 1.18.0 and convert to meson
In-Reply-To: <20200924222340.4e38185d@gmx.net>
References: <20200916194933.24921-1-ps.report@gmx.net>
 <20200916194933.24921-12-ps.report@gmx.net>
 <20200923223020.751ca54a@windsurf>
 <20200924222340.4e38185d@gmx.net>
Message-ID: <20200925090317.3f72a8ed@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 24 Sep 2020 22:23:40 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> From streamer1-editing-services-1.18.0/examples/c/meson.build
> 
> # TODO Properly port to Gtk 3
> #
> # if gtk_dep.found()
> #     examples = examples + ['ges-ui']
> # endif
> 
> So, the only example needing gtk is skipped for this version...
> 
> But thinking a little about, I would prefer to disable the
> example support at whole...

It seems reasonable indeed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
