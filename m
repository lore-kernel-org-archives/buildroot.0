From: Dan Lyke <danlyke@flutterby.com>
Date: Tue, 14 Apr 2009 10:33:27 -0700
Subject: [Buildroot] Properly setting up hotplug
Message-ID: <20090414103327.2fd69516@danhplaptop>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

So I know I've gotten a Buildroot install that did this automatically
once, but through various incremental steps I've gotten a kernel that
has the hotplug stuff enabled, and if I

echo /bin/mdev > /proc/sys/kernel/hotplug

or just run "mdev -s" manually I get my hot-plugged devices created, but
I'm sure that at some point I had a system where buildroot had created
the appropriate init script for me.

Am I hallucinating, or to get this as part of the compile do I need to
copy my configs across to a fresh buildroot and make again?

And what's the "make" argument for Buildroot that should clean
everything, but not destroy my configs? "make clean" destroys configs,
or at least did last time I typed it...

Dan
