From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 18 Feb 2013 08:30:27 +0100
Subject: [Buildroot] [PATCH 1/4] fs/ext2: enclose the ext2 options in
 if...endif
In-Reply-To: <2c860a63881f99014f80c4bc8f47045ad4b46846.1361142401.git.yann.morin.1998@free.fr>
References: <cover.1361142401.git.yann.morin.1998@free.fr>
 <2c860a63881f99014f80c4bc8f47045ad4b46846.1361142401.git.yann.morin.1998@free.fr>
Message-ID: <5121D893.3080407@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18/02/13 00:10, Yann E. MORIN wrote:
> Use a 'if...endif' construct instead of repeating the
> 'depends on' for each symbols.
>
> Signed-off-by: "Yann E. MORIN"<yann.morin.1998@free.fr>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
