From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 Aug 2010 09:31:58 +0200
Subject: [Buildroot] [PATCH 14/20] netcat: prevent build system from
 adding a prefix to binaries
In-Reply-To: <87r5hpuyvc.fsf@macbook.be.48ers.dk>
References: <cover.1282471311.git.thomas.petazzoni@free-electrons.com>
	<cover.1282471311.git.thomas.petazzoni@free-electrons.com>
	<86047c4c4a4d951bfe590291c88a3d5b3f911180.1282471311.git.thomas.petazzoni@free-electrons.com>
	<87r5hpuyvc.fsf@macbook.be.48ers.dk>
Message-ID: <20100824093158.76c1f8af@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 23 Aug 2010 17:34:15 +0200
Peter Korsgaard <jacmet@uclibc.org> wrote:

> Does that work?

Yes, it did work.

> Elsewhere we always use --program-prefix=''.

Ok, will use this.

> While we're at it a bit of whitespace would increase readability,
> imho.

I've pushed a new version of the branch with those two fixes.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
