From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 01 Nov 2012 23:11:54 +0100
Subject: [Buildroot] Build gcc debugger for the Target
In-Reply-To: <CABtOAfxVfcmYSAa+X6ksTdbVVCq4_piWCyO-L0-JAdAnrq_TSA@mail.gmail.com>
References: <CABtOAfxuz7Hn+05yeTgGZTExttKFk_w31Pot3e-YSvx+weVpnw@mail.gmail.com>
 <CAHXCMM+aZH-FaqQ62CF=oapVK5zGPnbkEUNpUsHBvgY2Z_Dy0A@mail.gmail.com>
 <CABtOAfxVfcmYSAa+X6ksTdbVVCq4_piWCyO-L0-JAdAnrq_TSA@mail.gmail.com>
Message-ID: <5092F3AA.8090300@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/01/12 11:41, Alexander Khryukin wrote:
> Yes, i enabled Devel files on target, but gcc not available into "Development Tools".
>
> Also i using external toolchain, not buildroot.

  gcc on the target is only available with a buildroot toolchain.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
