From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 22 Apr 2013 20:18:26 +0200
Subject: [Buildroot] [PATCH 1/2] busybox: move patches to new model
In-Reply-To: <1366642067-26447-1-git-send-email-gustavo@zacarias.com.ar>
References: <1366642067-26447-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <51757EF2.3060000@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/04/13 16:47, Gustavo Zacarias wrote:
> On commit 5538e4766201aa0c1c23721cfc99cbbde595964b the versioned package
> patches changed the directory structure but the packages weren't fixed.
>
> Signed-off-by: Gustavo Zacarias<gustavo@zacarias.com.ar>
> ---
>   package/busybox/{busybox-1.19.4 => 1.19.4}/busybox-1.19.4-udhcp.patch     | 0
>   .../busybox/{busybox-1.20.2 => 1.20.2}/busybox-1.20.2-kernel_ver.patch    | 0
>   package/busybox/{busybox-1.20.2 => 1.20.2}/busybox-1.20.2-ntpd.patch      | 0
>   .../{busybox-1.20.2 => 1.20.2}/busybox-1.20.2-pkg-config-selinux.patch    | 0
>   .../busybox/{busybox-1.20.2 => 1.20.2}/busybox-1.20.2-sys-resource.patch  | 0
>   package/busybox/{busybox-1.21.0 => 1.21.0}/busybox-1.21.0-mdev.patch      | 0
>   package/busybox/{busybox-1.21.0 => 1.21.0}/busybox-1.21.0-platform.patch  | 0
>   package/busybox/{busybox-1.21.0 => 1.21.0}/busybox-1.21.0-xz.patch        | 0

  I believe the idea was to have plain NNNN-xxxx.patch files (without 
package or version number) in the patch directories - like is the case 
already for gcc and gdb. But check the developer day report to be sure.

  And while you're at it, numbering the patches would be nice.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
