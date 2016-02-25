From: Carlos Santos <casantos@datacom.ind.br>
Date: Thu, 25 Feb 2016 14:31:40 -0300
Subject: [Buildroot] [PATCH 1/1] uboot-tools: add option for dumpimage
In-Reply-To: <1456409941-10295-1-git-send-email-paulo.zaneti@datacom.ind.br>
References: <1456409941-10295-1-git-send-email-paulo.zaneti@datacom.ind.br>
Message-ID: <1456421500-1447-1-git-send-email-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Paulo Zaneti <paulo.zaneti@datacom.ind.br>

> The tool dumpimage extracts data from U-Boot images.
> U-Boot added dumpimage tool on release 2014.01.
> This commit allows installation on target and host.
> 
> Signed-off-by: Paulo Zaneti <paulo.zaneti@datacom.ind.br>
Tested-by: Carlos Santos <casantos@datacom.ind.br>

Built host (x86_64) and target (PowerPC) packages and verified that
both are compiled and installed properly.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
