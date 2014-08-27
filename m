From: =?windows-1252?Q?J=F6rg_Krause?= <jkrause@posteo.de>
Date: Wed, 27 Aug 2014 12:02:08 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-08-26
In-Reply-To: <20140827063010.1F56610167A@stock.ovh.net>
References: <20140827063010.1F56610167A@stock.ovh.net>
Message-ID: <53FDACA0.7080501@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On 08/27/2014 08:30 AM, Thomas Petazzoni wrote:
> Build statistics for 2014-08-26
> ===============================
>
>
>        bfin | libshairplay-139d5ef5556451... | NOK | http://autobuild.buildroot.net/results/7b13728386da6179608a1c7607565bd9bc357d86/

This is a problem with missing or not finding libdl. This is what my 
libshairplay/config.log shows:

configure:11508: 
/home/joerg/Freescale/buildroot/output/host/usr/bin/bfin-uclinux-gcc -o 
conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE 
-D_FILE_OFFSET_BITS=64  -pipe -Os   -Wl,-elf2flt -static 
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 
-elf2flt -static conftest.c -ldl   >&5
/home/joerg/Freescale/buildroot/output/host/opt/ext-toolchain/bfin-uclinux/bfin-uclinux/bin/ld.real: 
cannot find -ldl
