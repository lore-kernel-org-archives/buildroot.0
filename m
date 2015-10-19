From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Oct 2015 22:41:54 +0200
Subject: [Buildroot] [PATCH 2/2] xdriver_xf86-video-intel: add upstream
 patch fixing libdrm/kernel crash
In-Reply-To: <1445275224-3928-2-git-send-email-james.knight@rockwellcollins.com>
References: <1445275224-3928-1-git-send-email-james.knight@rockwellcollins.com>
 <1445275224-3928-2-git-send-email-james.knight@rockwellcollins.com>
Message-ID: <20151019224154.153ee1c5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear James Knight,

On Mon, 19 Oct 2015 13:20:24 -0400, James Knight wrote:
> When running this Intel driver with a newer libdrm/kernel (4.x), Xorg
> can crash (segmentation fault).
> 
> References:
>  http://cgit.freedesktop.org/xorg/driver/xf86-video-intel/commit/?id=7fe2b2948652443ff43d907855bd7a051d54d309
>  https://bugs.gentoo.org/show_bug.cgi?id=552124
>  https://bugzilla.opensuse.org/show_bug.cgi?id=931917
> 
> Signed-off-by: James Knight <james.knight@rockwellcollins.com>
> ---
>  .../0003-sna-libdrm-abi-protection.patch           | 65 ++++++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 package/x11r7/xdriver_xf86-video-intel/0003-sna-libdrm-abi-protection.patch

Applied with some tweaks:

    [Thomas:
      - add upstream link to the git commits in the patches themselves
      - add James SoB line inside the patches themselves]

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
