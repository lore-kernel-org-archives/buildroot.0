From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 8 Mar 2017 06:55:18 -0300
Subject: [Buildroot] [PATCH] kmscube: Move to the new repository
In-Reply-To: <CAAMH-yuhrg_CxW2YjdjBqrKExiHp57fsDyK_dWD3RXP0hhRWmA@mail.gmail.com>
References: <1488803273-25019-1-git-send-email-festevam@gmail.com>
 <20170306212225.0819a97b@free-electrons.com>
 <CAOMZO5Bpy6sBTTX1sHitL8mRsNDNF1_PWsvqRTrvfzhd2xG45A@mail.gmail.com>
 <20170306213121.203079d8@free-electrons.com>
 <CAAMH-yuhrg_CxW2YjdjBqrKExiHp57fsDyK_dWD3RXP0hhRWmA@mail.gmail.com>
Message-ID: <CAOMZO5AGOE8tnKEokxRBww92xoARZLHnrtbaQD1udZGORUfKuQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gary,

On Wed, Mar 8, 2017 at 6:39 AM, Gary Bisson
<gary.bisson@boundarydevices.com> wrote:

> I actually get a build error with this version:
> drm-atomic.c: In function ?get_plane_id?:
> drm-atomic.c:290:44: error: ?DRM_MODE_OBJECT_PLANE? undeclared (first
> use in this function)
>      drmModeObjectGetProperties(drm.fd, id, DRM_MODE_OBJECT_PLANE);
>
> In order to fix it I've had to add the following include to drm-atomic.c:
> #include <libdrm/drm_mode.h>
>
> In case it helps, I use linaro-arm-2017-02 toolchain.
>
> Let me know if you don't see that issue on your end.

No, I didn't see this error. Could you please send a patch to
Buildroot and also to the upstream project?

Thanks,

Fabio Estevam
