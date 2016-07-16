From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Jul 2016 12:16:38 +0200
Subject: [Buildroot] [PATCH 1/2] freescale-imx: update src url
In-Reply-To: <20160709080335.30055-1-daggs@gmx.com>
References: <20160709080335.30055-1-daggs@gmx.com>
Message-ID: <20160716121638.11247747@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  9 Jul 2016 11:03:34 +0300, Dagg Stompler wrote:

> -FREESCALE_IMX_SITE = http://www.freescale.com/lgfiles/NMG/MAD/YOCTO

The current site works fine for me:

>>> firmware-imx 5.4 Downloading
--2016-07-16 12:13:38--  http://www.freescale.com/lgfiles/NMG/MAD/YOCTO/firmware-imx-5.4.bin
Resolving www.freescale.com (www.freescale.com)... 23.35.121.50
Connecting to www.freescale.com (www.freescale.com)|23.35.121.50|:80... connected.
HTTP request sent, awaiting response... 301 Moved Permanently
Location: http://www.nxp.com/lgfiles/NMG/MAD/YOCTO/firmware-imx-5.4.bin [following]
--2016-07-16 12:13:38--  http://www.nxp.com/lgfiles/NMG/MAD/YOCTO/firmware-imx-5.4.bin
Resolving www.nxp.com (www.nxp.com)... 23.206.34.99
Connecting to www.nxp.com (www.nxp.com)|23.206.34.99|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: unspecified [application/octet-stream]
Saving to: ?/home/thomas/projets/buildroot/output/build/.firmware-imx-5.4.bin.EORoO8/output?

/home/thomas/projets/buildroot/output/b     [  <=>                                                                          ] 419,67K  1,57MB/s    in 0,3s    

2016-07-16 12:13:39 (1,57 MB/s) - ?/home/thomas/projets/buildroot/output/build/.firmware-imx-5.4.bin.EORoO8/output? saved [429744]

firmware-imx-5.4.bin: OK (sha256: c5bd4bff48cce9715a5d6d2c190ff3cd2262c7196f7facb9b0eda231c92cc223)
>>> imx-codec 4.0.9 Downloading
--2016-07-16 12:13:39--  http://www.freescale.com/lgfiles/NMG/MAD/YOCTO/imx-codec-4.0.9.bin
Resolving www.freescale.com (www.freescale.com)... 23.35.121.50
Connecting to www.freescale.com (www.freescale.com)|23.35.121.50|:80... connected.
HTTP request sent, awaiting response... 301 Moved Permanently
Location: http://www.nxp.com/lgfiles/NMG/MAD/YOCTO/imx-codec-4.0.9.bin [following]
--2016-07-16 12:13:40--  http://www.nxp.com/lgfiles/NMG/MAD/YOCTO/imx-codec-4.0.9.bin
Resolving www.nxp.com (www.nxp.com)... 23.206.34.99
Connecting to www.nxp.com (www.nxp.com)|23.206.34.99|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: unspecified [application/octet-stream]
Saving to: ?/home/thomas/projets/buildroot/output/build/.imx-codec-4.0.9.bin.0meccC/output?

/home/thomas/projets/buildroot/output/b     [                         <=>                                                   ]   9,56M  1,93MB/s    in 5,1s    

2016-07-16 12:13:45 (1,87 MB/s) - ?/home/thomas/projets/buildroot/output/build/.imx-codec-4.0.9.bin.0meccC/output? saved [10024936]

imx-codec-4.0.9.bin: OK (sha256: 62bda182143cde9743cba0eb2a1c315a53cb434294605742f9fc364219958888)
>>> imx-gpu-viv 5.0.11.p8.4-hfp Downloading
--2016-07-16 12:13:45--  http://www.freescale.com/lgfiles/NMG/MAD/YOCTO/imx-gpu-viv-5.0.11.p8.4-hfp.bin
Resolving www.freescale.com (www.freescale.com)... 23.35.121.50
Connecting to www.freescale.com (www.freescale.com)|23.35.121.50|:80... connected.
HTTP request sent, awaiting response... 301 Moved Permanently
Location: http://www.nxp.com/lgfiles/NMG/MAD/YOCTO/imx-gpu-viv-5.0.11.p8.4-hfp.bin [following]
--2016-07-16 12:13:45--  http://www.nxp.com/lgfiles/NMG/MAD/YOCTO/imx-gpu-viv-5.0.11.p8.4-hfp.bin
Resolving www.nxp.com (www.nxp.com)... 23.206.34.99
Connecting to www.nxp.com (www.nxp.com)|23.206.34.99|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: unspecified [application/octet-stream]
Saving to: ?/home/thomas/projets/buildroot/output/build/.imx-gpu-viv-5.0.11.p8.4-hfp.bin.5malXu/output?

/home/thomas/projets/buildroot/output/b     [                                         <=>                                   ] 102,21M  1,90MB/s    in 56s     

2016-07-16 12:14:42 (1,81 MB/s) - ?/home/thomas/projets/buildroot/output/build/.imx-gpu-viv-5.0.11.p8.4-hfp.bin.5malXu/output? saved [107172712]

imx-gpu-viv-5.0.11.p8.4-hfp.bin: OK (sha256: 8f79ce562d8ac1efb0a2af403b405541f98c55ae1631a18a3d7fad3224dfb44b)
>>> imx-parser 4.0.9 Downloading
--2016-07-16 12:14:43--  http://www.freescale.com/lgfiles/NMG/MAD/YOCTO/imx-parser-4.0.9.bin
Resolving www.freescale.com (www.freescale.com)... 23.35.121.50
Connecting to www.freescale.com (www.freescale.com)|23.35.121.50|:80... connected.
HTTP request sent, awaiting response... 301 Moved Permanently
Location: http://www.nxp.com/lgfiles/NMG/MAD/YOCTO/imx-parser-4.0.9.bin [following]
--2016-07-16 12:14:44--  http://www.nxp.com/lgfiles/NMG/MAD/YOCTO/imx-parser-4.0.9.bin
Resolving www.nxp.com (www.nxp.com)... 23.206.34.99
Connecting to www.nxp.com (www.nxp.com)|23.206.34.99|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: unspecified [application/octet-stream]
Saving to: ?/home/thomas/projets/buildroot/output/build/.imx-parser-4.0.9.bin.G3votu/output?

/home/thomas/projets/buildroot/output/b     [     <=>                                                                       ]   1,78M  1,83MB/s    in 1,0s    

2016-07-16 12:14:45 (1,83 MB/s) - ?/home/thomas/projets/buildroot/output/build/.imx-parser-4.0.9.bin.G3votu/output? saved [1862047]

imx-parser-4.0.9.bin: OK (sha256: 1bec0101843db2e95d61e3dbe9e35172d874e54be19cc5d8bf72a735d5e3236f)
>>> imx-uuc 0.5.1 Downloading
--2016-07-16 12:14:45--  http://www.freescale.com/lgfiles/NMG/MAD/YOCTO/imx-uuc-0.5.1.tar.gz
Resolving www.freescale.com (www.freescale.com)... 23.35.121.50
Connecting to www.freescale.com (www.freescale.com)|23.35.121.50|:80... connected.
HTTP request sent, awaiting response... 301 Moved Permanently
Location: http://www.nxp.com/lgfiles/NMG/MAD/YOCTO/imx-uuc-0.5.1.tar.gz [following]
--2016-07-16 12:14:45--  http://www.nxp.com/lgfiles/NMG/MAD/YOCTO/imx-uuc-0.5.1.tar.gz
Resolving www.nxp.com (www.nxp.com)... 23.206.34.99
Connecting to www.nxp.com (www.nxp.com)|23.206.34.99|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 14215 (14K) [application/x-gzip]
Saving to: ?/home/thomas/projets/buildroot/output/build/.imx-uuc-0.5.1.tar.gz.pZo0Yy/output?

/home/thomas/projets/buildroot/output/b 100%[==============================================================================>]  13,88K  --.-KB/s    in 0,003s  

2016-07-16 12:14:45 (5,24 MB/s) - ?/home/thomas/projets/buildroot/output/build/.imx-uuc-0.5.1.tar.gz.pZo0Yy/output? saved [14215/14215]

imx-uuc-0.5.1.tar.gz: OK (sha256: 95d7f7b075f58fedc07602fbc0e5bf5212d28deea3d09cdbcbd80992dcd18482)
>>> imx-vpu 5.4.33 Downloading
--2016-07-16 12:14:47--  http://www.freescale.com/lgfiles/NMG/MAD/YOCTO/imx-vpu-5.4.33.bin
Resolving www.freescale.com (www.freescale.com)... 23.35.121.50
Connecting to www.freescale.com (www.freescale.com)|23.35.121.50|:80... connected.
HTTP request sent, awaiting response... 301 Moved Permanently
Location: http://www.nxp.com/lgfiles/NMG/MAD/YOCTO/imx-vpu-5.4.33.bin [following]
--2016-07-16 12:14:47--  http://www.nxp.com/lgfiles/NMG/MAD/YOCTO/imx-vpu-5.4.33.bin
Resolving www.nxp.com (www.nxp.com)... 23.206.34.99
Connecting to www.nxp.com (www.nxp.com)|23.206.34.99|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: unspecified [application/octet-stream]
Saving to: ?/home/thomas/projets/buildroot/output/build/.imx-vpu-5.4.33.bin.TdpXOi/output?

/home/thomas/projets/buildroot/output/b     [ <=>                                                                           ] 105,63K   680KB/s    in 0,2s    

2016-07-16 12:14:47 (680 KB/s) - ?/home/thomas/projets/buildroot/output/build/.imx-vpu-5.4.33.bin.TdpXOi/output? saved [108169]

imx-vpu-5.4.33.bin: OK (sha256: 2e670ef2337a5dbe6c32fa07128ad9aad32afdbf472c23d44133245ec6a66d46)



-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
