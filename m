From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 10 Jan 2014 07:55:47 +0100
Subject: [Buildroot] [PATCH 4 of 5 v3] squashfs3: remove deprecated
	package/rootfs
In-Reply-To: <4ddef97a82357d616713.1388764973@argentina>
References: <patchbomb.1388764969@argentina>
 <4ddef97a82357d616713.1388764973@argentina>
Message-ID: <52CF9973.2040205@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/01/14 17:02, Thomas De Schampheleire wrote:
> Signed-off-by: Thomas De Schampheleire<thomas.de.schampheleire@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

>
> ---
> Note: I did not add a legacy entry for  BR2_TARGET_ROOTFS_SQUASHFS4 because
> it's simply removed, its role now played by the parent
> BR2_TARGET_ROOTFS_SQUASHFS. Therefore, I don't think we need legacy symbols
> in this case, right?

  This should have been part of the commit message...

  But I agree with the principle.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
