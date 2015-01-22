From: Gary Bisson <bisson.gary@gmail.com>
Date: Wed, 21 Jan 2015 22:47:57 -0800
Subject: [Buildroot] [PATCH v6 00/15] Add Xorg support for iMX6
In-Reply-To: <1421451251-23366-1-git-send-email-jezz@sysmic.org>
References: <1421451251-23366-1-git-send-email-jezz@sysmic.org>
Message-ID: <CADCpmyOp078FVzrQqR8xehha56O4Db3roVKPQL2Zj97NwFJoUQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jerome,

On Fri, Jan 16, 2015 at 3:33 PM, J?r?me Pouiller <jezz@sysmic.org> wrote:
> Hello,
>
> Main purpose of this serie is to add support of Vivante GPU (found on imx6) to
> Xorg. This work is mainly adapted from Yocto.
>
> v6:
>   - Rebase on master
>   - Add license for xdriver_xf86-video-imx-viv. Notice this package does not
>     provide any license file.
>   - Fix typos suggested by Thomas P.
>   - Fix dependency on libdrm (gpu-viv-bin-mx6q does not depends on libdrm, but
>     xdriver_xf86-video-imx-viv does depend)
>   - Add a note about runtime dependencies in gpu-viv-bin-mx6q
>   - Splited patch 6/15 in 3 parts
>   - Splited patch 10/15 in 2 parts
>   - Make 0001-Force_egl_visual_ID_33.patch contionnal
>

I confirm this patchset applies and builds fine on master. However I
couldn't get X to start properly as it was complaining that no screen
was available (using the same setup as before: nitrogen6x + HDMI
monitor). I didn't have time to investigate any further but have you
had any issue? I think the X server version has been bumped lately,
are you still using the same xorg.conf?
I'll try to get more info before the end of the week.

Thanks,
Gary
