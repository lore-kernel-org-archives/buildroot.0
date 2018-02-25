From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Feb 2018 22:34:38 +0100
Subject: [Buildroot] [PATCH 2/3] package/strace: add missing libunwind
 optional dependency
In-Reply-To: <CAAXf6LXnevwOqgTb7yV5AraDkHsauEfhJNoQr8rNgWFLQKp15Q@mail.gmail.com>
References: <20180225183415.8362-1-romain.naour@gmail.com>
 <20180225183415.8362-2-romain.naour@gmail.com>
 <CAAXf6LXnevwOqgTb7yV5AraDkHsauEfhJNoQr8rNgWFLQKp15Q@mail.gmail.com>
Message-ID: <20180225223438.42357172@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Sun, 25 Feb 2018 21:28:19 +0100, Thomas De Schampheleire wrote:

> In our local tree, I had added a config option to strace for that, but
> perhaps that is overkill?

Are you saying that you have changes in your local tree on packages
available in upstream Buildroot, and you did not submit such
changes ? :-)

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
