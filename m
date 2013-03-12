From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 12 Mar 2013 18:44:41 +0100
Subject: [Buildroot] [PATCH 5/6] fs/ext2: add support for ext2 rev0 and
	rev1
In-Reply-To: <31898da643046864f71fe6c6b553cc4bd00f0897.1362693453.git.yann.morin.1998@free.fr>
References: <cover.1362693453.git.yann.morin.1998@free.fr>
 <31898da643046864f71fe6c6b553cc4bd00f0897.1362693453.git.yann.morin.1998@free.fr>
Message-ID: <513F6989.70202@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/07/13 23:04, Yann E. MORIN wrote:
> Some bootloaders have a buggy ext2 support, and require ext2 rev1
> instead of the traditional ext2 rev0 that genext2fs produces.
>
> tune2fs accepts only one '-O list' at a time, so we need to construct
> a list of -O options.
>
> Signed-off-by: "Yann E. MORIN"<yann.morin.1998@free.fr>
> Cc: Arnout Vandecappelle<arnout@mind.be>

  I like your new approach for gen/rev configuration!

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


  Regards,
  Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
