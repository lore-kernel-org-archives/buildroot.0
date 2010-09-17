From: Marcus Osdoba <marcus.osdoba@googlemail.com>
Date: Fri, 17 Sep 2010 20:03:03 +0200
Subject: [Buildroot] How to rebuild the kernel only
In-Reply-To: <4C93A950.90901@signaturealpha.com>
References: <4C93A950.90901@signaturealpha.com>
Message-ID: <4C93AD57.1020604@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Am 17.09.2010 19:45, schrieb Marc Leclerc:
>  Hi,
>
> any option to only rebuild the kernel (bsImage) ?
>
Yes. Outside buildroot ;-)
It's not possible to make clean and compile ONLY the kernel afterwards. 
The whole selected userland and/or toolchains will be rebuilt.
It is of course possible to download the kernel sources and bake the 
kernel yourself on your host.

Regards,
Marcus
