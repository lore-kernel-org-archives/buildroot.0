From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 Oct 2011 08:48:37 +0200
Subject: [Buildroot] [PATCH 1/9] external toolchain: slightly optimize
 the copy of the toolchain sysroot
In-Reply-To: <20111010084334.2d3d0544@skate>
References: <cover.1318182187.git.thomas.petazzoni@free-electrons.com>
 <cover.1318182187.git.thomas.petazzoni@free-electrons.com>
 <98f060c40fdcc7c9d5464838a21d2ee7bc44971a.1318182187.git.thomas.petazzoni@free-electrons.com>
 <87ehylesfb.fsf@macbook.be.48ers.dk>
 <20111010084334.2d3d0544@skate>
Message-ID: <20111010084837.596f8d00@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 10 Oct 2011 08:43:34 +0200,
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> a ?crit :

> $ rsync --version | grep version
> rsync  version 3.0.7  protocol version 30

Ok, I saw the discussion on IRC. The problem seems to be with rsync
3.0.8 only. Older versions and newer versions are unaffected. The
reference discussed on IRC was:
http://lists.samba.org/archive/rsync/2011-May/026369.html.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
