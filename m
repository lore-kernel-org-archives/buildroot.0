From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 13 Dec 2012 23:57:26 +0100
Subject: [Buildroot] [PATCH 2/4] package/qemu: fix host dependencies
In-Reply-To: <f3379896be4cbb7b0c1348fb207ecd6696702842.1355434710.git.yann.morin.1998@free.fr>
References: <cover.1355434710.git.yann.morin.1998@free.fr>
 <f3379896be4cbb7b0c1348fb207ecd6696702842.1355434710.git.yann.morin.1998@free.fr>
Message-ID: <50CA5D56.6090807@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13/12/12 22:39, Yann E. MORIN wrote:
> 'host-*' packages should depends on other 'host-*' packages,
> not on target packages.
>
> Reported-by: Arnout Vandecappelle<arnout@mind.be>
> Signed-off-by: "Yann E. MORIN"<yann.morin.1998@free.fr>
> Cc: Francois Perrad<fperrad@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
