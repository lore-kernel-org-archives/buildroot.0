From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Apr 2014 22:19:46 +0200
Subject: [Buildroot] [PATCH v2] libdrm: needs threads
In-Reply-To: <1398102235-32101-1-git-send-email-romain.naour@openwide.fr>
References: <1398102235-32101-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20140421221946.0b82b3b0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Mon, 21 Apr 2014 19:43:55 +0200, Romain Naour wrote:
> libdrm select libpthread-stubs that needs threads support.
> 
> Fixes:
> http://autobuild.buildroot.net/results/1da/1dad13110312a44b40b9ee4050b265de1f3c8a42/build-end.log
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
> v2: Fix display comment (Yann)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
