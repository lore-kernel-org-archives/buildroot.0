From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 Nov 2012 10:07:18 +0100
Subject: [Buildroot] Build gcc debugger for the Target
In-Reply-To: <5092F3AA.8090300@mind.be>
References: <CABtOAfxuz7Hn+05yeTgGZTExttKFk_w31Pot3e-YSvx+weVpnw@mail.gmail.com>
 <CAHXCMM+aZH-FaqQ62CF=oapVK5zGPnbkEUNpUsHBvgY2Z_Dy0A@mail.gmail.com>
 <CABtOAfxVfcmYSAa+X6ksTdbVVCq4_piWCyO-L0-JAdAnrq_TSA@mail.gmail.com>
 <5092F3AA.8090300@mind.be>
Message-ID: <20121102100718.5c373c79@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Thu, 01 Nov 2012 23:11:54 +0100, Arnout Vandecappelle wrote:

> > Also i using external toolchain, not buildroot.
> 
>   gcc on the target is only available with a buildroot toolchain.

Right. Though technically speaking, I don't think there is anything
that really prevents us from building a gcc for the target even if we
use an external toolchain, but nobody ever needed that.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
