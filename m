From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Dec 2013 13:33:46 +0100
Subject: [Buildroot] [PATCH] uclibc: add a special Xtensa version
In-Reply-To: <9b77c89fe5b99a3303c667afbebe857f1f8be0b0.1388316386.git.baruch@tkos.co.il>
References: <9b77c89fe5b99a3303c667afbebe857f1f8be0b0.1388316386.git.baruch@tkos.co.il>
Message-ID: <20131229133346.78e4137b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Sun, 29 Dec 2013 13:26:26 +0200, Baruch Siach wrote:
> From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> Currently, the Xtensa architecture uses the "snapshot" version of
> uClibc. This means that the build is not reproducible, since it will
> pick whatever latest version of uClibc is available at the moment of
> the build.
> 
> This commit replaces that by adding a special Xtensa version, which
> points to a well-known Git commit. This is something we should
> hopefully be able to remove once the uClibc people realize that doing
> a 0.9.34 release would be useful.
> 
> Should probably fix:
> 
>   http://autobuild.buildroot.org/results/5d6/5d6072a038acf894d832704e36c1d43f0254abf5/build-end.log
> 
> at least I wasn't able to reproduce the build problem.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> [baruch: use a more recent uClibc version]
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
