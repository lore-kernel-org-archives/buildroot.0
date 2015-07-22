From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Jul 2015 11:05:53 +0200
Subject: [Buildroot] [PATCH] libiio: Add a patch from upstream to fix
 building without a C++ compiler
In-Reply-To: <1437554705-24757-1-git-send-email-paul.cercueil@analog.com>
References: <1437554705-24757-1-git-send-email-paul.cercueil@analog.com>
Message-ID: <20150722110553.6860b6af@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Paul,

On Wed, 22 Jul 2015 10:45:05 +0200, Paul Cercueil wrote:
> This fixes a build issue reported by the autobuilder.
> 
> Signed-off-by: Paul Cercueil <paul.cercueil@analog.com>

I've added the autobuilder build failure reference as suggested by
Baruch and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
