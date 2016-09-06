From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Sep 2016 21:53:56 +0200
Subject: [Buildroot] [PATCH 8/9] package/enlightenment: bump to v0.21.2
In-Reply-To: <1472848295-13734-8-git-send-email-romain.naour@gmail.com>
References: <1472848295-13734-1-git-send-email-romain.naour@gmail.com>
 <1472848295-13734-8-git-send-email-romain.naour@gmail.com>
Message-ID: <20160906215356.098f4100@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  2 Sep 2016 22:31:34 +0200, Romain Naour wrote:
> Remove upstream patch.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  ...uid.h-only-when-Wayland-support-is-enable.patch | 39 ----------------------
>  package/enlightenment/enlightenment.hash           |  4 +--
>  package/enlightenment/enlightenment.mk             |  2 +-
>  3 files changed, 3 insertions(+), 42 deletions(-)
>  delete mode 100644 package/enlightenment/0001-E-include-uuid.h-only-when-Wayland-support-is-enable.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
