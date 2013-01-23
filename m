From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Jan 2013 16:45:36 +0100
Subject: [Buildroot] [RFC v1 01/14] Add a new "src" directory in the
 output directory
In-Reply-To: <2395397.i0MApMWjWq@sagittae>
References: <1358725943-31485-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1436311.zC6hLLIaar@sagittae> <20130122174902.3f2eca8b@skate>
 <2395397.i0MApMWjWq@sagittae>
Message-ID: <20130123164536.58d9e607@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?me Pouiller,

On Tue, 22 Jan 2013 18:12:49 +0100, J?r?me Pouiller wrote:

> > This last point is the main reason. For now, the
> > LINUX_OVERRIDE_SRCDIR mechanism is barely usable because it does a
> > complete rsync of the Linux source tree, which is very annoying.
> > So, switching all packages to out of tree build sounds like an
> > interesting solution.
> And what about building in a subdirectory of source directory ? 

I am not sure why you think it would solve any problem, but it is
anyway not possible for packages for which <pkg>_OVERRIDE_SRCDIR is
used: we certainly do *not* want to build in a subdirectory of the
source directory.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
