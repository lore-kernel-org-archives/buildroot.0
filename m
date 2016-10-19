From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed, 19 Oct 2016 13:04:04 +0000
Subject: [Buildroot] Webtool to analyze package build fail/pass from
	autobuild
In-Reply-To: <EB86EB452ADE4B44B294F7149B8A277702219383@DE02WEMBXB.internal.synopsys.com>
References: <EB86EB452ADE4B44B294F7149B8A277702219383@DE02WEMBXB.internal.synopsys.com>
Message-ID: <1476882214.26312.22.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, 2016-10-11 at 11:44 +0000, Cupertino Miranda wrote:
> Hello everyone,
> 
> I am part of the ARC GNU team at Synopsys.
> More recently in order to analyze progress in buildroot package builds,
> I created a web tool that recovers latest build information from
> autobuild.buildroot.net and creates an internal database and web-tools
> to access it.
> 
> This database/webtool is organize such that we can track progress of
> which packages are failing or passing at any specific moment, and trace
> this failures to a specific build where we can analyze any of the build
> related logs.
> 
> Moreover, each day/week the tool generates a report sent to all the
> team, where it clearly specifies which packages started failing or
> passed during the period.
> 
> As this tools have been proven to be of great value to us, perhaps you
> would feel the same.
> The code is shared in:
> https://github.com/foss-for-synopsys-dwc-arc-processors/buildroot_stats
> 
> Looking forward for your feedback.?

I'm wondering if there's any interest in proposed thing from your side?

This tool works for us internally for quite some time now,
still I think others may benefit from it too.

We may indeed deploy it on some public server and encourage people
to start using that but I'm not sure if there's a point in adding
"3rd-party" services around?http://autobuild.buildroot.net/?instead
of enhancing autobuild server itself.

-Alexey
