From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Nov 2016 22:32:06 +0100
Subject: [Buildroot] [PATCH] libpjsip: bump to 2.5.5
In-Reply-To: <1478467809-25561-1-git-send-email-luca@lucaceresoli.net>
References: <1478467809-25561-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <20161106223206.4c9bab11@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  6 Nov 2016 22:30:09 +0100, Luca Ceresoli wrote:
> Remove patches now upstream.
> Disable new optional features: webrtc and opus.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> ---
>  ...ypes-compatible-with-musl-fixes-musl-buil.patch | 53 --------------
>  ...ched_priority-with-sched_priority-fixes-m.patch | 82 ----------------------
>  package/libpjsip/libpjsip.hash                     |  6 +-
>  package/libpjsip/libpjsip.mk                       |  4 +-
>  4 files changed, 6 insertions(+), 139 deletions(-)
>  delete mode 100644 package/libpjsip/0001-Use-mutex-types-compatible-with-musl-fixes-musl-buil.patch
>  delete mode 100644 package/libpjsip/0002-Replace-__sched_priority-with-sched_priority-fixes-m.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
