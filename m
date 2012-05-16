From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 May 2012 13:41:49 +0200
Subject: [Buildroot] [PATCH resend] source-check: change behavior to
 check only selected packages / add source-check-all
In-Reply-To: <cceaa854b98654b39b1f.1337107383@beantl019720>
References: <cceaa854b98654b39b1f.1337107383@beantl019720>
Message-ID: <20120516134149.7f9d9d04@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 15 May 2012 20:43:03 +0200,
Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :

> The original 'source-check' target first selects all packages, and then checks
> whether the package tarballs can be found. This is useful for Buildroot
> maintainers, but less useful for developers working on a specific project. The
> latter only care about the packages used in that project.
> 
> This patch removes the allyesconfig dependency to source-check so that only
> selected packages are checked. The original behavior is moved to a new target
> 'source-check-all'.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
