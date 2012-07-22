From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Jul 2012 18:24:32 +0200
Subject: [Buildroot] [PATCH 1 of 6 resend] pkg-download.mk: allow using
 localfiles outside of package infrastructure
In-Reply-To: <1dcdff3e9437fc63cd4b.1340343754@beantl019720>
References: <patchbomb.1340343753@beantl019720>
 <1dcdff3e9437fc63cd4b.1340343754@beantl019720>
Message-ID: <20120722182432.4b3a3057@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 22 Jun 2012 07:42:34 +0200,
Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :

> The localfiles download method uses $($(PKG)_SITE))) and
> $($(PKG)_SOURCE) instead of $(1) and $(2). This means that it can only
> be used for package downloads (through gentargets, autotargets, ...)
> and not for other downloads like external toolchains.
> 
> This patch changes localfiles to allow this, just as the wget and scp
> download methods already did.
> For the version control download methods, nothing changes.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Applied all 6 patches, thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
