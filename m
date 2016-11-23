From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Nov 2016 22:56:33 +0100
Subject: [Buildroot] [PATCH v4 05/18] reproducibility/linux: override
 build timestamp
In-Reply-To: <1479905937-17241-6-git-send-email-jezz@sysmic.org>
References: <1479905937-17241-1-git-send-email-jezz@sysmic.org>
 <1479905937-17241-6-git-send-email-jezz@sysmic.org>
Message-ID: <20161123225633.3975605a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 23 Nov 2016 13:58:44 +0100, J?r?me Pouiller wrote:
> From: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
> 
> Linux kernel include a few information about build environment in its binary.
> This feature is incompatible with BR2_REPRODUCIBLE. This patch overload build
> information when BR2_REPRODUCIBLE is enabled.
> 
> Note that usage of KBUILD_BUILD_TIMESTAMP is not mandatory since Buildroot
> use `fakedate'. However, native solution is prefered when upstream
> provide one.
> 
> Signed-off-by: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> ---

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
