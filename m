From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Dec 2012 12:34:39 +0100
Subject: [Buildroot] Autobuilders screwed up
Message-ID: <20121224123439.11983c10@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

As you have probably noticed, the autobuilders are screwed up.
Basically, we reached 32000 results, and since I store each result in a
directory, all gathered in a single directory, we reached the
per-sub-directory limit of the filesystem.

While trying to fix that up, I did some crap, and now some older
results appear in the middle of the latest results. I'll fix that up,
but as you know, it's Christmas, family and all, so it might have to
wait until tomorrow.

Sorry for the mess,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
