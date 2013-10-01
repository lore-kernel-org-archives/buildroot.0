From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Oct 2013 23:31:35 +0200
Subject: [Buildroot] [PATCH] package/Config.in: order alphabetically
In-Reply-To: <2fd3fbf902d87dab33eb.1380096103@argentina>
References: <2fd3fbf902d87dab33eb.1380096103@argentina>
Message-ID: <20131001233135.7a011a18@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Wed, 25 Sep 2013 10:01:43 +0200, Thomas De Schampheleire wrote:
> Even though new packages are normally added in the right alphabetical order,
> there still remain quite a number of incorrect orderings in package/Config.in.
> In this patch, alphabetical order is created in each menu.
> 
> Note that this sometimes mean that packages that logically belong together, like
> cups, gutenprint, hplip, are now split apart.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
