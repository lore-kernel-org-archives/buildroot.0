From: Jakob Cornell <jakob@jcornell.net>
Date: Sat, 10 Aug 2019 18:32:24 -0500
Subject: [Buildroot] Help with forcing a rebuild of the target
Message-ID: <f24ed451-f97c-b75c-e4e7-2c662b96c0c1@jcornell.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I've been working with Buildroot for a few weeks, and I occasionally find that I want to undo a change I've made to the 'output/target' tree. This is usually because I want to remove a file previously added using an overlay or because there are stale files leftover from a package that I've deselected.

So what I want to do, ideally, is run everything needed to fully populate the target filesystem, but also ensure that only what's needed is there. I've tried removing 'output/target' or individual files in it, but that often breaks the build. I've been resorting to doing a full clean and build, which is very wasteful. Is there any way to clean out the target tree and rebuild it without having to recompile anything?

Thanks,
Jakob
