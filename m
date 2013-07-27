From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Jul 2013 16:31:16 +0200
Subject: [Buildroot] [PATCH] toolchain-external: support toolchains with
 lib32 directories
In-Reply-To: <6ea92f8ae6dd3f73dba1.1374236718@BEANTN0L019720>
References: <6ea92f8ae6dd3f73dba1.1374236718@BEANTN0L019720>
Message-ID: <20130727163116.410ceb2e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Fri, 19 Jul 2013 14:25:18 +0200, Thomas De Schampheleire wrote:
> Some toolchains, like the Cavium Networks' one, have lib32/ and lib64/
> directories, while the standard lib/ is empty. To find libc.a, buildroot
> currently only looks in lib/ and lib64/. This patch extends the search
> to lib32/ as well.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Committed, thanks.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
