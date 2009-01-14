From: Sven Neumann <s.neumann@phase-zero.de>
Date: Wed, 14 Jan 2009 15:50:17 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/cairo
In-Reply-To: <COL102-DS153B476E9992200EBB96B2DCD60@phx.gbl>
References: <20090114133637.93DCB769A1@busybox.osuosl.org>
	<COL102-DS153B476E9992200EBB96B2DCD60@phx.gbl>
Message-ID: <1231944617.6465.10.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 2009-01-14 at 14:24 +0000, Daniel Laird wrote:
> I think the same can be done for libglib2 and libgtk2 to stop them
> installing as well which would be nice.

Same for

 gst-plugins-base-libs
 gstreamer-0.10
 gstreamer-plugins-0.10
 liboil

and probably some more. I'll apply the same fix to the gupnp packages
that I proposed in bug 35. Will attach an updated patch later...


Sven
