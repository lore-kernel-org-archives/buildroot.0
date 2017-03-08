From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Wed, 8 Mar 2017 16:17:15 +0100
Subject: [Buildroot] [PATCH] kmscube: Move to the new repository
In-Reply-To: <CAOMZO5DS7SBwS+Arvb-7a=6B3=4Jo75QAdNh6toAwFsgzvUwdw@mail.gmail.com>
References: <1488803273-25019-1-git-send-email-festevam@gmail.com>
 <20170306212225.0819a97b@free-electrons.com>
 <CAOMZO5Bpy6sBTTX1sHitL8mRsNDNF1_PWsvqRTrvfzhd2xG45A@mail.gmail.com>
 <20170306213121.203079d8@free-electrons.com>
 <CAAMH-yuhrg_CxW2YjdjBqrKExiHp57fsDyK_dWD3RXP0hhRWmA@mail.gmail.com>
 <CAOMZO5AGOE8tnKEokxRBww92xoARZLHnrtbaQD1udZGORUfKuQ@mail.gmail.com>
 <CAAMH-yuY=34_k46VPjhDVjLZCaopPsqDe8tRQ5MfqFeW5i+HQQ@mail.gmail.com>
 <CAOMZO5DS7SBwS+Arvb-7a=6B3=4Jo75QAdNh6toAwFsgzvUwdw@mail.gmail.com>
Message-ID: <CAAMH-ys1J+wuKrEQ7dN=YbcbgTB+kjK0SJJV4Cvj2X9G0yf1pQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabio,

On Wed, Mar 8, 2017 at 1:40 PM, Fabio Estevam <festevam@gmail.com> wrote:
> Hi Gary,
>
> On Wed, Mar 8, 2017 at 7:06 AM, Gary Bisson
> <gary.bisson@boundarydevices.com> wrote:
>
>> Before sending a patch I'd like to understand why the error only shows
>> up in my case and not yours. I also trust that Rob built his atomic
>> addition before pushing it.
>>
>> Can you send me the output of 'make kmscube-rebuild V=1' in your environment?
>
> Sure, here is the log:
> http://pastebin.com/QBDVLFDq

Thanks but I don't see anything obviously different between our configs.

> I just used the default toolchain from Buildroot.

Can you tell me where is DRM_MODE_OBJECT_PLANE defined in your case?

Here is my output:
$ grep -rn DRM_MODE_OBJECT_PLANE output/host/usr/arm-buildroot-linux-gnueabihf/
output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/libdrm/drm_mode.h:336:#define
DRM_MODE_OBJECT_PLANE 0xeeeeeeee

Also, is adding my fix to your build bringing any issue?

Regards,
Gary
