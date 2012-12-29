From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Dec 2012 08:59:47 +0100
Subject: [Buildroot] (no subject)
In-Reply-To: <1356745553-15362-1-git-send-email-stefan.froberg@petroprogram.com>
References: <1356745553-15362-1-git-send-email-stefan.froberg@petroprogram.com>
Message-ID: <20121229085947.130784d2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Stefan Fr?berg,

On Sat, 29 Dec 2012 03:45:48 +0200, Stefan Fr?berg wrote:

> Finally after dosens of reruns got damn Mesa 8.0.5 to compile.
> The biggest obstacle was src/glsl/builtin_compiler but after
> searching Net for how others had done it I finally got it.
> 
> mesa3d-uclibc-locale.patch did not apply cleanly anymore to this
> version.
> So I had to fetch new one from openembedded repo.
> Did take also few other patches from there 
> and fixed execinfo.h stuff.

Thanks. Having five patches with the same title is not correct. And
since it seems your five patches are all together needed to get Mesa
8.0.5 to build, then you should simply merge your five patches into
just one.

I'm adding specific comments on each patch.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
