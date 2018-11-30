From: =?UTF-8?Q?Andr=c3=a9_Hentschel?= <nerv@dawncrow.de>
Date: Fri, 30 Nov 2018 18:07:16 +0100
Subject: [Buildroot] Buildroot with i.MX 8QuadXPlus
Message-ID: <ba560a90-e57c-0ec7-76fa-3f9635979976@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Erik,

As your patches for imx8m already stated, at some point other imx8 
variants will arrive.
I meanwhile have a imx8qxpmek board, and I'm not really familiar with 
i.MX8 yet (only i.MX6). That's why I have some questions.

With upstreaming in mind I stumble across:
IMX_MKIMAGE_VERSION = imx_4.9.51_imx8m_beta
Should we use a common version here and move specific versions into the 
defconfig?

You said in https://patchwork.ozlabs.org/cover/882714/ that GPU and VPU 
are not supported yet, so I wonder a bit about 
https://patchwork.ozlabs.org/patch/882715/ which looks like that is the 
case.

I never needed arm-trusted-firmware and thus have no clue yet what it is 
about. Does it link to secureboot? Is it really needed to boot i.MX8?
