From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Jun 2015 23:31:55 +0200
Subject: [Buildroot] [PATCH 1/2 v2] package/libtirpc: bump version
In-Reply-To: <09555f7a62006a5327be21dc3705ef6547c0a8c7.1434292018.git.yann.morin.1998@free.fr>
References: <cover.1434292018.git.yann.morin.1998@free.fr>
 <09555f7a62006a5327be21dc3705ef6547c0a8c7.1434292018.git.yann.morin.1998@free.fr>
Message-ID: <20150614233155.40f7b59d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 14 Jun 2015 16:29:05 +0200, Yann E. MORIN wrote:
> Bump to version 0.3.1:
>   - update our patches
>   - rename patches for proper numbering
>   - drop patch 0007, applied upstream

It looks all good, but...

> -Subject: [PATCH] Disable parts of TIRPC requiring NIS support
> +Subject: [PATCH 1/5] Disable parts of TIRPC requiring NIS support

could you use "git format-patch -N" to avoid the numbering inside the
patches themselves? It generally quickly gets wrong when we add more
patches, and is a bit unnecessary due to the numbering already being
present through the file names.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
