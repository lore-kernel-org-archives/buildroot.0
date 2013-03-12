From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 12 Mar 2013 18:23:32 +0100
Subject: [Buildroot] Fwd: Google doesn't help Buildroot newcomers really
 much
In-Reply-To: <CAMFO430Fv-AZ+5bO=4pZR+VDzMAXE=mmzYCrMYx5FOVuKYh3yQ@mail.gmail.com>
References: <CAMFO431gatpdNG5oEcAQqCWVLs6St6-0P1SBA3h3SiTimk5tvg@mail.gmail.com>
 <CAMFO433vmKwUuc6ap2654izNBpchHu7_6wzG10MisbGO9rvF6w@mail.gmail.com>
 <20130309151845.6a7da709@skate>
 <CAMFO430Fv-AZ+5bO=4pZR+VDzMAXE=mmzYCrMYx5FOVuKYh3yQ@mail.gmail.com>
Message-ID: <513F6494.2070206@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/11/13 15:23, Marc Schultz wrote:
[snip]
> BR2_LINUX_KERNEL_UIMAGE=y
> # BR2_LINUX_KERNEL_VMLINUX is not set
> # BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM is not set

  Upstream kernel doesn't support uImage (it's a U-Boot image, but under 
a different name). Select BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM and set 
the image name to vmImage.

  But I guess you had to do that in the blackfin buildroot fork as well, 
no? Or maybe they have a fix to linux/linux.mk to change the name into 
vmImage for blackfin...

  Regards,
  Arnout

[snip]
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
