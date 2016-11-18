From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Nov 2016 12:41:58 +0100
Subject: [Buildroot] [PATCH v2 07/15] reproducibility/busybox: disable
 build timestamps
In-Reply-To: <1479460224-6119-8-git-send-email-jezz@sysmic.org>
References: <1479460224-6119-1-git-send-email-jezz@sysmic.org>
 <1479460224-6119-8-git-send-email-jezz@sysmic.org>
Message-ID: <20161118124158.29c92b3f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 18 Nov 2016 10:10:16 +0100, J?r?me Pouiller wrote:
> From: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
> 
> Busybox include a few information about build environment in its binary. This
> feature is incompatible with BR2_REPRODUCIBLE feature. This patch overload build
> information when BR2_REPRODUCIBLE is enabled.
> 
> Signed-off-by: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

I will apply this one to the next branch soon, unless someone complains.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
