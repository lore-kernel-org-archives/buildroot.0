From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Apr 2010 22:49:37 +0200
Subject: [Buildroot] [PATCH 1/1] lsof: bump to 4.83
In-Reply-To: <1271681108-923-1-git-send-email-mroth@nessie.de>
References: <1271681108-923-1-git-send-email-mroth@nessie.de>
Message-ID: <20100419224937.3c0e55fb@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 19 Apr 2010 14:45:08 +0200
Michael Roth <mroth@nessie.de> wrote:

> Bumped lsof to version 4.83 and decreased the patches theirs
> root directory by one level to make future version bumps easier
> because lsof has an unconventional directory structure.
> 
> Reworked lsof.mk to remove some repeated typing.

Thanks Michael for doing this. While you're at it, would you mind
converting this package to the generic package infrastructure, as
described at
http://buildroot.org/downloads/buildroot.html#generic-tutorial

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
