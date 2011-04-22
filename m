From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 22 Apr 2011 15:25:27 +0200
Subject: [Buildroot] prefer static libraries question
In-Reply-To: <201104121836.55644.vapier@gentoo.org>
References: <9AC3F0E75060224C8BBC5BA2DDC8853A1F99AC7E@EXV1.corp.adtran.com>
	<201104120248.26575.vapier@gentoo.org>
	<9AC3F0E75060224C8BBC5BA2DDC8853A1FA8E4DC@EXV1.corp.adtran.com>
	<201104121836.55644.vapier@gentoo.org>
Message-ID: <20110422152527.7ec95de5@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 12 Apr 2011 18:36:54 -0400
Mike Frysinger <vapier@gentoo.org> wrote:

> might be better to rename or add a new option.  then the build logic
> is clear: if user *prefers* static linking, we'll still build/install
> shared libs, but we'll generate static programs everywhere.  if the
> user *only* wants static builds, then we can skip the shared lib
> stuff entirely.

Does the "prefers" use case really makes sense ? I have always found
our BR2_PREFER_STATIC_LIB a bit odd, and I think it should be
BR2_USE_STATIC_LIB instead, and compile everything statically.

What do you think ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
