From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Jul 2012 21:51:00 +0200
Subject: [Buildroot] [PATCH v2] libplayer: fix handling of cflags in
 configure
In-Reply-To: <1342301676-23857-1-git-send-email-arnout@mind.be>
References: <1342301676-23857-1-git-send-email-arnout@mind.be>
Message-ID: <20120715215100.7e280618@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sat, 14 Jul 2012 23:34:36 +0200,
"Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be> a ?crit :

> Problem was found when compiling libplayer with GStreamer support
> on x86_64 with a Sourcery toolchain.

I've tried to build libplayer with gstreamer support for x86_64 with a
Sourcery toolchain, and I didn't had an issue. Since your problem was
quoting related, I thought that it could be caused by the ccache
support, but it isn't.

Can you post the .config that triggers the problem, or provide more
details on the problem? It's not that I don't believe that there is a
problem, but without producing it, I feel a bit out of infos to review
the patch.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
