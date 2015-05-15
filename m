From: Lionel Orry <lionel.orry@gmail.com>
Date: Fri, 15 May 2015 11:39:59 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2015-05-14
In-Reply-To: <20150515063015.5F31C1028C1@stock.ovh.net>
References: <20150515063015.5F31C1028C1@stock.ovh.net>
Message-ID: <CAKAx1cgGButj2=6xUUV_jn8+FE=VP--u4XnXF7pRCT=2-jtk_g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Fri, May 15, 2015 at 8:30 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Build statistics for 2015-05-14
> ===============================
>
>         success : 337
>        failures : 22
>        timeouts : 0
>           TOTAL : 359
>
> Classification of failures by reason
> ====================================
>
>                   boost-1.57.0 | 5
>            uboot-tools-2015.04 | 2
>                  webkit-1.11.5 | 1
>                      php-5.6.8 | 1
>             python-pyqt-4.11.3 | 1
>               strongswan-5.3.0 | 1
>                 libedje-1.7.10 | 1
>        opentyrian-9c9f0ec3532b | 1
>                   snmppp-3.3.4 | 1
>               libarchive-3.1.2 | 1
>                    duma-2.5.15 | 1
>                  cdrkit-1.1.11 | 1
>                libgtk3-3.14.11 | 1
>                openswan-2.6.42 | 1
>                    zmqpp-3.2.0 | 1
>                 tinyxml2-2.2.0 | 1
>                 minidlna-1.1.4 | 1
>
> Detail of failures
> ===================
>
>      powerpc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/d4d9dc648b4abbd7bd8fd42e5b28df61f1ec48ce/
>      powerpc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/0f34bf6fbc4a594ef22949111725b0e07b204d21/
>        nios2 |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/84b992792409e14fdcd082fdba79187acc412bc4/
>      powerpc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/be1069e8528d299f487f431f7e2d793413ccbab8/
>        nios2 |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/e08ef5b37a0e176f9f6fbdec8d03a1d8e6ffddbe/
>       mipsel |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/b5cc11d3186fc896d0fb633e0190799d69e0021e/
>       xtensa |                    duma-2.5.15 | NOK | http://autobuild.buildroot.net/results/24cfa414805d20bf399dd1cba8cb581a7ee3f05b/
>         bfin |               libarchive-3.1.2 | NOK | http://autobuild.buildroot.net/results/e96c8bec1039d9fe8c6c51fd48b6be0dc8be51d7/
>      powerpc |                 libedje-1.7.10 | NOK | http://autobuild.buildroot.net/results/b39614a025d3d03d1bd79fa810fe3822a73fadad/
>      powerpc |                libgtk3-3.14.11 | NOK | http://autobuild.buildroot.net/results/b3c78cc7c5f8c85bd7eca95c83d5adce756c2a12/
>       mipsel |                 minidlna-1.1.4 | NOK | http://autobuild.buildroot.net/results/df299ab66c3ec56bc576b0296e3cbae746103e67/
>       xtensa |                openswan-2.6.42 | NOK | http://autobuild.buildroot.net/results/d8ca113411686b1e7ee590247c1462ddb2c78521/
>         bfin |        opentyrian-9c9f0ec3532b | NOK | http://autobuild.buildroot.net/results/25e7b9d80e76c2f8a49f1b54cd6e908643e156b0/
>         bfin |                      php-5.6.8 | NOK | http://autobuild.buildroot.net/results/d1f3a8cc7fbd1de6cbc6564e862e5a83caa66352/
>          arm |             python-pyqt-4.11.3 | NOK | http://autobuild.buildroot.net/results/5301eb57dd569db69e69d6b24192799ff538e5d0/
>          arm |                   snmppp-3.3.4 | NOK | http://autobuild.buildroot.net/results/712c8083b9eeafa41b60790961028c40b28f59ad/
> microblazeel |               strongswan-5.3.0 | NOK | http://autobuild.buildroot.net/results/2e5fbef2a6cb364e39cbd29303e8e3ef89db9a3e/
>         bfin |                 tinyxml2-2.2.0 | NOK | http://autobuild.buildroot.net/results/433e258adc59fe1aab66136fe224579cd2eac840/
>          arm |            uboot-tools-2015.04 | NOK | http://autobuild.buildroot.net/results/93499d7d8e948fed609fa5cfe87968ba32186866/
>      aarch64 |            uboot-tools-2015.04 | NOK | http://autobuild.buildroot.net/results/ad1d15ad5402d45b7c942a5fae176d73f9362679/
>          arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/0c13f56cefc7faf0135cb010bd22fd85a5c07bbe/
>          sh4 |                    zmqpp-3.2.0 | NOK | http://autobuild.buildroot.net/results/d9ec39dc5829aac1b25bfea7484458fcebd68412/

src/client/main.cpp:30:10: error: 'EXIT_FAILURE' was not declared in this scope

I am pushing a fix upstream for this one. I'll send the patch here if accepted.

>
>
> --
> http://autobuild.buildroot.net
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Regards,
Lionel
