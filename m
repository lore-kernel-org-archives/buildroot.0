From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Aug 2013 12:00:35 +0200
Subject: [Buildroot] [PATCH 2 of 6 v2] linux: don't take HEAD as default
 for git repositories
In-Reply-To: <6d0a6d80647910c487ba.1374650579@BEANTN0L019720>
References: <patchbomb.1374650577@BEANTN0L019720>
 <6d0a6d80647910c487ba.1374650579@BEANTN0L019720>
Message-ID: <20130813120035.3a8bb4f4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Wed, 24 Jul 2013 09:22:59 +0200, Thomas De Schampheleire wrote:
> Specifying a floating tag like HEAD for a repository version is bad practice,
> as it results in non-reproducible builds. This patch removes the default
> assignment of HEAD as version when a custom git repository is used for the
> Linux kernel.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
