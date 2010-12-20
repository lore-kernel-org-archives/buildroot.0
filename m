From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Mon, 20 Dec 2010 10:08:45 +0100
Subject: [Buildroot] qemu_ppc_g3beige_defconfig kernel image type (with
	patch)
In-Reply-To: <20101220085838.6f9787ee@surf>
References: <AANLkTinnVwRMDN91ZYL8bWcJdncpg+qzrpho=X=gNes0@mail.gmail.com>
	<AANLkTikMMHpan0BZuLEV2yvc_Wm9twqYWg23heRgNizV@mail.gmail.com>
	<20101220085838.6f9787ee@surf>
Message-ID: <AANLkTi=A2q6Th_nSyVQSAfU57mOpJVZ3RNBB-DqTV+7j@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 20 December 2010 08:58, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> On Sun, 19 Dec 2010 17:04:05 +0100
> Bj?rn Forsman <bjorn.forsman@gmail.com> wrote:
>
>> I just realized that QEMU handles uImage very well, but I think the
>> patch is still valid.
>
> Hum, zImage wasn't working for me on Qemu PowerPC. I'll re-test.

Well, I haven't actually tested the zImage/uImage on PPC myself because
qemu-system-ppc seems broken on Ubuntu 10.10:

  qemu: hardware error: qemu: could not load PowerPC bios 'openbios-ppc'

So my patch may be wrong and linux/Config.in should allow vmlinux for
PPC instead. I don't know.
The point is that the current defconfig file gets overridden. And that
should get fixed, one way or the other.

Best regards,
Bj?rn Forsman
