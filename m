From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Sun, 1 Apr 2012 14:50:32 -0400
Subject: [Buildroot] [PATCH 1/3 v4] uboot: Add support for U-Boot SPL
In-Reply-To: <1332108292-28094-2-git-send-email-n-dechesne@ti.com>
References: <1332108292-28094-1-git-send-email-n-dechesne@ti.com>
 <1332108292-28094-2-git-send-email-n-dechesne@ti.com>
Message-ID: <CA+-urNSFFMihFnBUwN7mM11fv1Z96qczApS_a2bjg1a4VU1cBA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Mar 18, 2012 at 6:04 PM, Nicolas Dechesne <n-dechesne@ti.com> wrote:
>
> SPL is a first stage bootloader. On pandaboard it supercedes x-loader,
> and should now be used.
>
> This patch ensures that either SPL or xloader can be selected.
>
> A config variable has been added for the name of the SPL binary generated
> during u-boot build. For most platform it is u-boot-spl.bin but not
> always.
> It is MLO on OMAP for example.
>
> Signed-off-by: Nicolas Dechesne <n-dechesne@ti.com>
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

I started following the pandaboard patches, since parts are also
useful for the beaglebone. I'm not sure what their status is, but if
it helps, this particular patch is:

Tested-by: Frank Hunleth <fhunleth@troodon-software.com>

Supposing these get included, I'll need to send an updated beaglebone patch.

Frank
