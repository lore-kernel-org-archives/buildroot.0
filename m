From: Michael S. Zick <minimod@morethan.org>
Date: Sat, 18 Aug 2012 07:01:50 -0500
Subject: [Buildroot] [Bug 5462] webkit doesn't build on directfb
In-Reply-To: <20120817161626.D0E9C971EA@busybox.osuosl.org>
References: <bug-5462-163@https.bugs.busybox.net/>
 <20120817161626.D0E9C971EA@busybox.osuosl.org>
Message-ID: <201208180701.53228.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri August 17 2012, bugzilla at busybox.net wrote:
> https://bugs.busybox.net/show_bug.cgi?id=5462
> 
> --- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2012-08-17 16:16:26 UTC ---
> Thanks Vincent for the report. It is similar to
> http://autobuild.buildroot.net/results/74637e3a3e4c37c3af0f3662504c28332e9c586c/build-end.log.
> 
> We need to investigate if this is really Webkit that doesn't support DirectFB
> as a Gtk backend. If this is the case, then we simply need to prevent Webkit
> from being built if the selected Gtk backend is DirectFB.
> 
> Or it is just a bug in Webkit that shouldn't include this header file, or
> should include it conditionnally or something like that.
> 
> I personaly don't have enough time right now to dig into Webkit, so if you
> could have a look at this and give us your conclusions, it would be great.
> Thanks!
> 

The Kindle K4 and K5 come from the factory with a webkit browser that
works on the directFB device.

Not sure if it is using Gtk, but it is using X11.

Mike
