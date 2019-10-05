From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 05 Oct 2019 11:36:11 +0200
Subject: [Buildroot] [PATCH 1/4] package/llvm: add llvm RTTI option
References: <20191005093009.1020308-1-romain.naour@gmail.com>
Message-ID: <bp4m6gxbel.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sat, 05 Oct 2019 11:30:06 +0200 schrieb Romain Naour:

> Allow to build LLVM with run-time type information when this feature is
> needed (for example) by mesa3d's Gallium Nouveau driver or the Clover
> OpenCL state tracker when llvm support is enabled in mesa3d.
> 
> Signed-off-by: Romain Naour
> <romain.naour@gmail.com>

Hi,

this patch does not apply on master, does it need
http://patchwork.ozlabs.org/patch/1095709/ ?

Regards, Bernd
