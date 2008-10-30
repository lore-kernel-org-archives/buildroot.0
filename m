From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Oct 2008 14:44:39 +0100
Subject: [Buildroot] [PATCH 6/9] Ask the kernel source where it will
 install modules
In-Reply-To: <fa686aa40810300623o637f3b9fk5820cb21bf9ef05c@mail.gmail.com>
References: <20081016203220.15826.26173.stgit@localhost.localdomain>
	<20081016203246.15826.56394.stgit@localhost.localdomain>
	<20081030142018.1377e1b1@surf>
	<fa686aa40810300623o637f3b9fk5820cb21bf9ef05c@mail.gmail.com>
Message-ID: <20081030144439.6720468f@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 30 Oct 2008 07:23:53 -0600,
"Grant Likely" <grant.likely@secretlab.ca> a ?crit :

> When using a git kernel tree for instance, LINUX26_VERSION is set to
> "linux-git" to match the directory that the kernel is unpacked into
> but the kernel source could be reporting just about any
> "linux-vX.Y.Z-<sha1>".

Ok, got it. Thanks for the precision.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
