From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Jan 2012 12:26:49 +0100
Subject: [Buildroot] Buildroot Developer Day, Friday 3rd February,
 Brussels
In-Reply-To: <CAAXf6LU_=sZ4fw_mJ=FL1JZjpc5+Fqf=K=wWQCbHtGLkyZVaBA@mail.gmail.com>
References: <20120124000812.6d043023@skate>
 <CAAXf6LW6aCs-G_FD=pXNGsBrV3133donzNxsuNV_7O=9JMCs4Q@mail.gmail.com>
 <201201271133.20517.arnout@mind.be>
 <CAAXf6LU_=sZ4fw_mJ=FL1JZjpc5+Fqf=K=wWQCbHtGLkyZVaBA@mail.gmail.com>
Message-ID: <20120130122649.71f44783@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 30 Jan 2012 10:19:12 +0100,
Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :

> For most packages, the version to be used is hardcoded in the .mk
> file. For others, like gdb, there is a choice of versions via the
> .config file. I understand we cannot supply such gdb-like
> configuration for all packages as that would be way overkill. However,
> another mechanism could be used, e.g. like the source directory
> override feature (but then: version override).

It is relatively easy to do version override, but the problem is that
if you override the version, most likely you'll also need to override
the other variables: the configuration options change between versions,
the build procedure might change, etc. So in the end we will end up
needing to be able to override everything. We will discuss this on
Friday, but I'm not sure it is possible to do this in a nice and
maintainable way.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
