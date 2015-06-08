From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 08 Jun 2015 22:28:34 +0200
Subject: [Buildroot] [PATCH 1/1] fs/romfs: add U-Boot image support
In-Reply-To: <1433782196-17824-1-git-send-email-hoang.tran@vnoss.org>
References: <1433782196-17824-1-git-send-email-hoang.tran@vnoss.org>
Message-ID: <5575FAF2.7060901@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/08/15 18:49, Hoang Tran wrote:
> Adds U-Boot image support for romfs root filesystems. This allows you to
> use the bootm command in U-Boot to load the rootfs.

 Why would you want to do that? I don't see any reason to use the old
block-device-initrd rather than the usual cpio-initramfs...


 Regards,
 Arnout

> 
> Signed-off-by: Hoang Tran <hoang.tran@vnoss.org>
[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
