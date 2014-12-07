From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Dec 2014 13:04:38 +0100
Subject: [Buildroot] [PATCH 2/5 v2] suppot/download: add option parsing
 to the download wrapper
In-Reply-To: <7f3140282a6843b4d229d873a1e7076573df9a2f.1417949583.git.yann.morin.1998@free.fr>
References: <cover.1417949583.git.yann.morin.1998@free.fr>
 <7f3140282a6843b4d229d873a1e7076573df9a2f.1417949583.git.yann.morin.1998@free.fr>
Message-ID: <20141207130438.35328feb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun,  7 Dec 2014 12:02:35 +0100, Yann E. MORIN wrote:

> +help() {
> +    cat <<_EOF_
> +NAME
> +    ${my_name} - downlaod wrapper for Buildroot
> +
> +SYNOPSIS
> +    ${my_name} [OPTION]... -- [BACKEND OPTION]...

Why do you create help text that look like man pages? It is very
unusual, most Unix commands don't have a help text that look like a man
page.

I had the same reflexion on the mke2img thing.

> +DESCRIPTIOM

DESCRIPTION

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
