From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jul 2015 23:30:12 +0200
Subject: [Buildroot] [PATCH] qt5base/gpu_vivante: Fix activation of
 visualID workaround
In-Reply-To: <1438074385-6443-1-git-send-email-jezz@sysmic.org>
References: <1438074385-6443-1-git-send-email-jezz@sysmic.org>
Message-ID: <20150728233012.61d42dfd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?me Pouiller,

On Tue, 28 Jul 2015 11:06:25 +0200, J?r?me Pouiller wrote:
> 0001-Force_egl_visual_ID_33.patch have to be enabled as soon as gpu_vivante/xorg
> is used. This does not depends on eglfs option.
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> ---
>  package/qt5/qt5base/qt5base.mk | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)

Applied after some minor tweaks to the commit log, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
