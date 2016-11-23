From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Nov 2016 22:57:24 +0100
Subject: [Buildroot] [PATCH v4 07/18] reproducibility/busybox: disable
 build timestamps
In-Reply-To: <1479905937-17241-8-git-send-email-jezz@sysmic.org>
References: <1479905937-17241-1-git-send-email-jezz@sysmic.org>
 <1479905937-17241-8-git-send-email-jezz@sysmic.org>
Message-ID: <20161123225724.472a8638@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 23 Nov 2016 13:58:46 +0100, J?r?me Pouiller wrote:
> From: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
> 
> Busybox includes some information about the build environment in its
> binary. For BR2_REPRODUCIBLE, remove that information.
> 
> Signed-off-by: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
